// === Step 1: 輸入 Set Scale 的參數 ===
Dialog.create("Set Scale");
Dialog.addNumber("Distance in pixels:", 100.0);
Dialog.addNumber("Known distance:", 1000.0);
Dialog.addString("Unit (e.g., micron):", "um");
Dialog.show();
distancePixels = Dialog.getNumber();
knownDistance = Dialog.getNumber();
unit = Dialog.getString();

// === Step 2: 選擇輸入與輸出資料夾 ===
inputDir = getDirectory("Select Input Folder");
outputDir = getDirectory("Select Output Folder");

// 建立輸出資料夾（如尚未存在）
File.makeDirectory(outputDir);

// === Step 3: 取得所有影像檔名 ===
fileList = getFileList(inputDir);

// === Step 4: 批次處理每一張圖像 ===
for (i = 0; i < fileList.length; i++) {
    open(inputDir + fileList[i]); // 開啟影像

    // 設定比例尺
    run("Set Scale...", "distance=" + distancePixels + " known=" + knownDistance + " unit=" + unit + " global");

    // 清除舊結果
    run("Clear Results");

    // 處理流程
    run("16-bit");
    setAutoThreshold("Default no-reset");
    setOption("BlackBackground", false);
    run("Convert to Mask");
    run("Analyze Particles...", "size=25.00-Infinity circularity=0.50-1.00 show=[Overlay Masks] display exclude overlay");

    // 套用 overlay 到圖像
    run("Flatten");

    // 建立檔名
    imageName = fileList[i]; 
    processedImagePath = outputDir + imageName + "_processed.png";
    csvPath = outputDir + imageName + "_data.csv";

    // 儲存處理後影像與測量結果
    saveAs("PNG", processedImagePath);
    saveAs("Measurements", csvPath);

    // 關閉所有開啟視窗
    run("Close All");
}

// === Step 5: 結束訊息 ===
print("? Batch processing completed!");
