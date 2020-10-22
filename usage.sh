# Usage function fot git-remote-updater

usage () {
    echo "[USAGE] $1"
    echo "  $1 [...flags]"
    echo ""
    echo "  Flags :"
    echo "   --repo             : Specify the git repository's path"
    echo "   --remote-url|-u    : Specify the remote's URL [MANDATORY]"
    echo "   --remote-name|-r   : Specify the remote's name (origin by default)"
    echo "   -h|--help          : Prints out this output"
    echo "   -v|--verbose       : NOT IMPLEMENTED YET"
    echo "   -D|--debug         : NOT IMPLEMENTED YET"
}
