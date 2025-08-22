#!/bin/bash
BUCKET=${1:-my-bucket}
DEST=./backup_$(date +%F)
aws s3 sync s3://$BUCKET $DEST
echo "✅ Резервная копия $BUCKET сохранена в $DEST"
