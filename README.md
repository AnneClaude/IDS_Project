# Critical Evaluation of an ML Intrusion Detection System on NSL-KDD

**Course:** Data Science in Cyber  
**Author:** Anne Claude Abinader  

## Overview
This repository contains the codebase, analysis, and final report evaluating a machine-learning Intrusion Detection System (IDS) based on the NSL-KDD benchmark. The project specifically reproduces and critically evaluates the implementation found in the `KostasEreksonas/IDS_test` repository, which claims to achieve approximately 99% accuracy. 

While the headline accuracy figure is reproducible on a random 85/15 split of the training data, this project demonstrates that the performance collapses significantly when evaluated on the official `KDDTest+` hold-out dataset. The analysis highlights the critical importance of proper evaluation protocols and robust metrics (such as MCC and recall) over raw accuracy in imbalanced cybersecurity datasets.

## Key Findings
* **Reproducibility:** The original claim of ~99% accuracy is reproducible *in-distribution* (using a random split of `KDDTrain+`), with Decision Tree and Random Forest models achieving a Matthews Correlation Coefficient (MCC) of $\approx 0.99$.
* **Generalisation Failure:** On the official `KDDTest+` hold-out, performance degrades sharply. The Random Forest model attains an MCC of only $0.6053$ and recalls just 61% of attacks.
* **Methodological Flaw:** The original author's evaluation protocol (testing on a random split of the training file rather than the designated hold-out) overstates the model's ability to generalise to novel attacks. The models memorise the signatures of known attack families rather than learning transferable malicious behaviour.
* **Metric Selection:** High accuracy on a random split of a closed benchmark is not sufficient evidence of real-world intrusion-detection capability. 

## Repository Structure
* `IDS_Analysis.ipynb`: The core Jupyter Notebook containing the data loading, exploratory data analysis (EDA), redundancy-aware feature engineering pipeline, model training, and evaluation.
* `IDS_project_report.pdf`: The comprehensive executive report detailing the problem, methodology, findings, and critical analysis of the original source. 

## Methodology
1. **Data Ingestion & Preprocessing:** Handled canonical NSL-KDD schema, dropped the target-leaking `difficulty_score` column, and conducted an integrity audit.
2. **Feature Engineering:** Implemented one-hot encoding, correlation-based feature selection ($\rho > 0.95$), and engineered two new features. 
3. **Model Training:** Trained and compared three models: Decision Tree, Random Forest, and Logistic Regression.
4. **Evaluation:** Assessed models both in-distribution and on the hold-out dataset using imbalance-robust metrics (MCC, $F_{2}$ score, and per-family recall) with an emphasis on the asymmetric cost of false negatives in a Security Operations Center (SOC).

## Execution Instructions
To reproduce the analysis and findings of this project:
1. Clone this repository to your local machine.
2. Ensure you have a working Python environment with Jupyter Notebook installed. Required packages include `pandas`, `numpy`, `scikit-learn`, `matplotlib`, and `seaborn`.
3. Download the dataset from the source linked below.
4. Open `IDS_Analysis.ipynb` and run the cells sequentially to reproduce the data pipeline, model training, and evaluation.

## Sources & References
* **Selected Article/Tutorial:** [Intrusion Detection System Using Machine Learning Algorithms (GeeksForGeeks)](https://www.geeksforgeeks.org/machine-learning/intrusion-detection-system-using-machine-learning-algorithms/)
* **Original GitHub Repository:** [KostasEreksonas/IDS_test](https://github.com/KostasEreksonas/IDS_test)
* **Dataset Source:** The specific NSL-KDD files used in this project were retrieved from the original author's repository: [NSL_KDD Data Folder](https://github.com/KostasEreksonas/IDS_test/tree/main/data/NSL_KDD)
