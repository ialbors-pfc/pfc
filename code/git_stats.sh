#! /bin/bash

cd $1

# Total number of commits
echo -n "Total commits: "
git rev-list --count master

# First commit date
echo -n "First commit: "
first=$(git log `git log --pretty=oneline --reverse | head -1|awk '{print $1}'` --format="%ad" --date=format:"%Y-%m-%d")

echo $first

# Nº de autores
echo -n "Nº authors: "
git log --format="%aN" | sort -u|wc -l

# Number of commits per year
echo "N commits per year: "
for i in `seq $(expr 2018 - 10) 2018`
do
  echo -n "$i: "
  git rev-list --count master --since "$i/01/01" --until "$(expr $i + 1)/01/01"
done 


# Number of authors per year
echo "N authors per year: "
for i in `seq $(expr 2018 - 10) 2018`
do
  echo -n "$i: "
  git log --format="%aN" --since "$i/01/01" --until "$(expr $i + 1)/01/01"|sort -u|wc -l
done 

cd - > /dev/null
