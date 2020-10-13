function isRelease() {
    GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [[ ("$GIT_BRANCH" == "master" || "$GIT_BRANCH" == "HEAD" ) ]]; then
        GIT_TAG_RN=$(git tag --points-at HEAD | head -n 1)
        if [[ ! -z "$GIT_TAG_RN" && ! "$GIT_TAG_RN" =~ -rc[0-9] ]]; then
            return 1
        fi
    fi 
    return 0  
}
isRelease
var=$?
echo $var
if [[ "$var" == 1 ]]; then 
	echo GOOD
fi
