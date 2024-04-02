#!/bin/bash

# Создание файла
echo "Hello, world!" > file.txt

# Инициализация git-репозитория
git init

# Первый коммит
git add file.txt
git commit -m "Initial commit"

# Initial prev_date setting to today. Adjust if you need a different start date.
prev_date=$(date +%Y-%m-%d)

for ((i=1; i<=130; i++))
do
  echo "Random change $i" >> file.txt
  git add file.txt
  git commit -m "Commit $i"

  # Ensure prev_date is correctly decremented. Use correct syntax for your system.
  # For macOS/BSD: Decrement the day by 1
  prev_date=$(date -j -v-1d -f "%Y-%m-%d" "$prev_date" +%Y-%m-%d)

  # Set the GIT_COMMITTER_DATE and amend the commit with the new date
  GIT_COMMITTER_DATE="$prev_date 12:00:00" git commit --amend --no-edit --date "$prev_date 12:00:00"
done
