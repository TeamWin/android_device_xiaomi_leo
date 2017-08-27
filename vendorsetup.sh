add_lunch_combo lineage_leo-eng
add_lunch_combo lineage_leo-userdebug

applyminotepropatch() {
	sh device/xiaomi/leo/patch/applypatch.sh
}

echo "** Make sure you have run after repo sync: applyminotepropatch"
