# Critical Evaluation of an ML Intrusion Detection System on NSL-KDD

**Course:** Data Science in Cyber  
**Author:** Anne Claude Abinader  

## Overview
This repository contains the codebase, analysis, and final report evaluating a machine-learning Intrusion Detection System (IDS) based on the NSL-KDD benchmark. The project critically evaluates the implementation found in the `KostasEreksonas/IDS_test` repository, which claims to achieve approximately 99% accuracy. 

While the headline accuracy figure is reproducible on a random internal split of the training data, this project demonstrates that performance collapses significantly when evaluated on the official `KDDTest+` hold-out dataset. Grounded in the foundational analysis by Tavallaee et al. (2009), this project highlights the critical importance of proper evaluation protocols and robust metrics (such as MCC and Recall) over raw accuracy when dealing with zero-day distribution shifts.

## Key Findings
* **The Accuracy Fallacy:** The original claim of ~99% accuracy is reproducible *in-distribution*, with baseline models achieving a Matthews Correlation Coefficient (MCC) of ~0.99.
* **Generalization Failure:** On the official `KDDTest+` hold-out, performance degrades sharply. The Random Forest model attains an MCC of only 0.605 and misses nearly 39% of active network attacks. 
* **Methodological Flaw:** Testing on a random split of the training file overstates the model's ability to generalize to novel attacks. The models merely memorize the signatures of known attack families rather than learning transferable malicious behavior.
* **Metric Selection:** In a Security Operations Center (SOC), a missed attack (False Negative) is far costlier than a false alarm. High accuracy on a closed benchmark is an invalid metric for real-world intrusion-detection capability.

## Repository Structure
* `IDS_Analysis.ipynb`: The core analytical workspace containing the dynamic data pipeline, feature engineering, and model evaluation loops.
* `IDS_project_report.pdf`: The comprehensive executive report detailing the problem, methodology, findings, and critical academic analysis.
* `requirements.txt`: Strict dependency boundaries for replicating the Python environment.
* `run.sh`: Shell script to automate environment setup, repository cloning, and execution.

## Methodology
1. **Data Ingestion:** Implemented a dynamic path-resolution pipeline to ingest the NSL-KDD dataset natively, avoiding hard-coded environment paths.
2. **Feature Engineering:** Handled categorical one-hot encoding, feature scaling (preventing data leakage via Pipelines), correlation-based feature selection (removing features with correlation > 0.95), and engineered two new composite features. 
3. **Expanded Model Suite:** Trained and evaluated an expanded benchmark suite of six algorithms: Decision Tree, Random Forest, Logistic Regression, Naïve Bayes, K-Nearest Neighbors (KNN), and Linear SVM.
4. **Evaluation:** Assessed models on the hold-out dataset using imbalance-robust metrics (MCC, F2 score, ROC-AUC, and per-family recall).

## Quick Start & Reproduction
This project is designed for strict reproducibility. To replicate the environment and execute the analysis:

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/AnneClaude/IDS_Project.git
   cd IDS_Project
  2. Run the automated setup script to install dependencies and clone the required dataset:
     ```bash
     bash run.sh
  3. Open IDS_Analysis.ipynb in your preferred Jupyter environment and execute the cells sequentially.
## Sources & References
Academic Grounding: Tavallaee, M., Bagheri, E., Lu, W., & Ghorbani, A. A. (2009). "A Detailed Analysis of the KDD CUP 99 Data Set." Proceedings of the 2009 IEEE Symposium on Computational Intelligence in Security and Defense Applications.

Target Source: Intrusion Detection System Using Machine Learning Algorithms (GeeksForGeeks)

Target Repository: KostasEreksonas/IDS_test
