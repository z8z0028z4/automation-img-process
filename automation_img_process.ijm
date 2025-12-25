// Select input and output folders
inputDir = getDirectory("Select Input Folder");
outputDir = getDirectory("Select Input Folder");

// Get list of all image files in the input folder
fileList = getFileList(inputDir);

// Loop through each image
for (i = 0; i < fileList.length; i++) {
    open(inputDir + fileList[i]); // Open image

    // Apply processing steps
    run("16-bit");
    setAutoThreshold("Default no-reset");
    setOption("BlackBackground", false);
    run("Convert to Mask");
    run("Analyze Particles...", "size=25.00-Infinity circularity=0.50-1.00 show=[Overlay Masks] display exclude overlay");

    // Define filenames for saving
    imageName = fileList[i]; 
    processedImagePath = outputDir + imageName + "_processed.png";
    csvPath = outputDir + imageName + "_data.csv";

    // Save processed image
    saveAs("PNG", processedImagePath);

    // Save analysis results as CSV
    saveAs("Results", csvPath);
    
    // Close image to process the next one
    close();
    close("Results"); // Close the results table
}

print("Batch processing completed!");
