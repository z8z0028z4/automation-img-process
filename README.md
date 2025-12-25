# ImageJ Automation: Batch Particle Analyzer

This repository contains an ImageJ macro script designed for automated image processing and batch particle analysis. It simplifies workflows involving scaling, thresholding, and measuring particles across multiple images.

## Features
- **Automated Scaling**: Easily set pixels-to-unit ratios for all images in a batch.
- **Batch Processing**: Process all images in a selected directory automatically.
- **Standardized Workflow**: Pre-configured for 16-bit conversion, thresholding, and mask generation.
- **Results Export**: Automatically saves processed images (flattened with overlay) and data (CSV) for each file.

## Repository Structure
- `scripts/`: Contains the main ImageJ macro (`batch_particle_analyzer.ijm`).
- `examples/`: Includes sample output data.
- `archive/`: Previous versions and original compressed files.

## Workflow Description
The automation follows these steps for each image:
1. **Set Scale**: Applies global scale parameters (Distance in pixels, Known distance, and Units).
2. **Preprocessing**: Converts the image to **16-bit**.
3. **Segmentation**: Applies a **threshold** to create a binary mask.
4. **Particle Analysis**:
   - Particle size: 25.00 - Infinity.
   - Circularity: 0.50 - 1.00.
   - Excludes particles on edges and displays overlay masks.
5. **Output**:
   - **Flattened Image**: A PNG version of the original image with the analysis overlay.
   - **CSV Data**: A measurement report for all detected particles.

## Getting Started
1. Open [ImageJ](https://imagej.net/) or [Fiji](https://fiji.sc/).
2. Drag and drop the script from `scripts/batch_particle_analyzer.ijm` into ImageJ.
3. Click "Run".
4. Follow the dialog prompts to set your scale and select source/destination folders.

---
*Created for automated image processing efficiency.*
