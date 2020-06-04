echo "Loading schemas ..."
for file in /schemas/*
do
  echo "[ ] Processing $file"
  mysql $mysql_flags < $file
  echo "[*] Finished processing $file"
done