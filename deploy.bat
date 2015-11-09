echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

:: Build the project.
hugo

:: Add changes to git.
git add -A

:: Commit changes.
set commit_msg=rebuilding site %date
if not "%1"=="" (set commit_msg %1)

echo %commit_msg%

git commit -m "%commit_msg%"

:: Push source and build repos.
git push origin master
git subtree push --prefix=public git@github.com:jeckbjy/blog.git gh-pages

pause