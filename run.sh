git clone -b gh-pages git@github.com:$GIT_USERNAME/$GIT_REPO.git gh-pages

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"

cp -R $SRC_COVERAGE_DIR/* gh-pages/$DST_COVERAGE_DIR
cd gh-pages

diff=$(git status -s | grep $DST_COVERAGE_DIR)
if [ -z $diff ]; then
    echo 'Skip gh-pages step because the coverage was not updated.'
    exit 0
fi

git add .
git commit -m "Updated code coverage: `date +'%Y-%m-%d%k:%M:%S'`"
git push origin gh-pages
