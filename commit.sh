#!/bin/bash

# Số commit muốn tạo
NUM_COMMITS=200
12
# Lặp tạo commit với ngày tăng dần
for ((i=NUM_COMMITS; i>=1; i--)); do
    # Tính ngày (bắt đầu từ 120 ngày trước, tiến về hiện tại)
    DATE=$(date -d "$i days ago" --iso-8601=seconds)

    # Ghi nội dung vào file (đảm bảo file tồn tại)
    echo "daily data  $i" > commit.txt

    # Thêm vào Git
    git add commit.txt

    # Commit với ngày cụ thể
    GIT_COMMITTER_DATE="$DATE" GIT_AUTHOR_DATE="$DATE" git commit -m "Commit $i on $DATE"
done

# Đẩy toàn bộ commit lên GitHub
git push origin main

