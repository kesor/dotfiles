# eza does not allow for "ls -altr" which is years of muscle memory broken.
# the wrapper script takes care of that. now eza works with "-altr" just fine.
{ lib
, writeScriptBin
, bash
, eza
}: with lib; writeScriptBin "ez-eza" ''
#!${lib.getExe bash}

args=()
while [ "''$#" -gt 0 ]; do
    arg="''$1"
    shift
    case "''$arg" in
        --)
            args+=("''$arg")
            break;
            ;;
        --directory)
            args+=("--list-dirs")
            ;; # Replace --directory with --list-dirs
        --numeric-uid-gid)
            args+=("--numeric")
            ;; # Replace --numeric-uid-gid with --numeric
        --block-size | --author | --escape | --dired | --full-time | --kibibytes | --literal | --quoting-style | --size | --time-style | --width)
            if [ "''$#" -gt 0 ] && [ "''${1#-}" = "''$1" ]; then
                shift
            fi
            ;;
        --sort | --sort=* | --time | --time=* | --indicator-style | --indicator-style=* | --color | --color=* | --hyperlink | --hyperlink=*)
            if [ "''${arg#*=}" != "''$arg" ]; then
                args+=("''$arg")
            else
                if [ "''$#" -gt 0 ] && [ "''${1#-}" = "''$1" ]; then
                    args+=("''$arg" "''$1")
                    shift
                else
                    args+=("''$arg")
                fi
            fi
            ;;
        --*)
            args+=("''$arg")
            ;;
        -*)
            arg="''${arg#-}"
            while [ -n "''$arg" ]; do
                char="''${arg%"''${arg#?}"}"
                case "''$char" in
                    t)
                        args+=("--sort=modified")
                        ;; # Suppress -t
                    r)
                        args+=("--reverse")
                        ;; # Suppress -r
                    S)
                        args+=("--sort=size")
                        ;; # Supress -S
                    s)
                        ;; # Supress -s (no equivalent in eza)
                    c)
                        args+=("--sort=changed")
                        ;; # Supress -c
                    u)
                        args+=("--sort=accessed")
                        ;; # Supress -u
                    1)
                        args+=("--oneline")
                        ;; # Supress -1
                    g)
                        args+=("--group")
                        ;; # Supress -g
                    d)
                        args+=("--list-dirs")
                        ;; # Supress -d
                    p)
                        args+=("--indicator-style=slash")
                        ;; # Supress -p
                    *)
                        args+=("-''${char}")
                        ;;
                esac
                arg="''${arg#?}"
            done
            ;;
        *)
            args+=("''$arg")
            ;;
    esac
done

args+=("''$@")

# Execute eza with the processed arguments
exec ${getExe eza} "''${args[@]}"
''
