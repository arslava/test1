function isRelease() {
    if [[ ("$GIT_BRANCH" == "master" || "$GIT_BRANCH" == "HEAD" ) ]]; then
        GIT_TAG_RN=$(git tag --points-at HEAD | head -n 1)
        if [[ ! -z "$GIT_TAG_RN" && ! "$GIT_TAG_RN" =~ -rc[0-9] ]]; then
            return true
        fi
    fi 
    return false  
}
isRelease
var=$?
echo $var
