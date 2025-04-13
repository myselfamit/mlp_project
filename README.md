Here’s a polished and professional version of your README, with consistent formatting, improved structure, and clear visuals while keeping the original personality and emojis. It’s now more organized, easier to read, and ready for GitHub or reports.

---

# 🌟 Autoformer Time-Series Forecasting

**Autoformer: Decomposition Transformers with Auto-Correlation for Long-Term Series Forecasting**  
Based on the [NeurIPS 2021 paper](https://arxiv.org/abs/2106.13008)

---

## 🚀 Project Overview

Autoformer is a state-of-the-art model designed for **long-term time-series forecasting**, leveraging decomposition and auto-correlation mechanisms to model trends and seasonal components 📈.

This project:

- ✅ Reproduces Autoformer results on the **Weather dataset** 🌦️  
- ✅ Extends it to forecast **CO levels** using the **UCI Air Quality Dataset** 🌬️  
- ✅ Analyzes outputs using `metrics_output.ipynb` 📓  
- ✅ Was developed as part of a course assignment to enhance the open-source Autoformer repository

<p align="center">
  <img src="https://github.com/thuml/Autoformer/raw/main/asset/autoformer_logo.png" height="150" alt="Autoformer Logo" />
  <br><b>Autoformer Architecture</b>
</p>

---

## 🛠️ Prerequisites

Ensure you have the following installed:

- **Python 3.6+** (preferably 3.9)
- **Git** for version control
- **Visual Studio Code** (optional, for editing)
- **Internet access** to download datasets and dependencies

---

## 📥 Setup Instructions

Let’s build this like a model rocket! 🚀

### 1. Create Project Folder 📁

Create a folder named `AutoformerProject`.

- **Windows**: Right-click → New → Folder → Name it `AutoformerProject`  
- **Mac/Linux**: Use Finder/File Explorer to create the folder

### 2. Install Tools 🛠️

#### Python

```bash
python --version
```

If missing, install Python 3.9 from [python.org](https://www.python.org/)  
✅ Ensure “Add Python to PATH” is selected on Windows

#### Git

```bash
git --version
```

If missing, download from [git-scm.com](https://git-scm.com)

#### (Optional) Visual Studio Code

Install from [code.visualstudio.com](https://code.visualstudio.com)

---

### 3. Clone the Repository 📦

Navigate to the project folder:

```bash
cd ~/Desktop/AutoformerProject
git clone https://github.com/thuml/Autoformer.git
cd Autoformer
```

Check contents:

```bash
ls     # Mac/Linux
dir    # Windows
```

---

### 4. Install Dependencies 📚

#### PyTorch

```bash
pip install torch==1.9.0
```

🔧 For Mac M1/M2 or GPU setups, see [pytorch.org](https://pytorch.org/) for compatible commands.

#### Other Libraries

```bash
pip install numpy pandas scikit-learn
```

Or install from `requirements.txt`:

```bash
pip install -r requirements.txt
```

---

### 5. Download Datasets 📂

Create the data folder:

```bash
mkdir data
```

Download and place files in `Autoformer/data/`:

- `weather.csv`: [Download from Google Drive]
- `air_quality1.csv`: From [UCI Repository](https://archive.ics.uci.edu/dataset/360/air+quality), renamed from `AirQualityUCI.csv`

Verify:

```bash
ls data     # or dir data (Windows)
```

---

## 🏃‍♂️ Running Autoformer

Time to forecast like a scientist 🔬!

---

### 1. Weather Dataset 🌦️

Run the official script:

```bash
cd Autoformer
bash ./scripts/Weather_script/Autoformer.sh
```

⚠️ On Windows:

- Open `.sh` in VS Code
- Copy the `python -u main.py ...` command
- Run it in Command Prompt

Results are saved in the `results/` folder.

---

### 2. Air Quality Dataset 🌬️

Run the custom script:

```bash
python -u run.py \
  --is_training 1 \
  --root_path ./data/ \
  --data_path air_quality1.csv \
  --model_id air_quality_96_96_single_target \
  --model Autoformer \
  --data custom \
  --features M \
  --target "CO(GT)" \
  --freq d \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 13 \
  --dec_in 13 \
  --c_out 1 \
  --des 'AirQuality' \
  --itr 1 \
  --train_epochs 2
```

📄 Location: `scripts/AirQuality_script/Autoformer_air_quality.sh`

Results: Saved in `results/air_quality_96_96_single_target_*`

---

### 3. Analyze Results 📓

Use `metrics_output.ipynb`:

```python
import os
import numpy as np

folder_path = "results/<experiment_folder>"
print("Files:", os.listdir(folder_path))

pred = np.load(f"{folder_path}/pred.npy")
true = np.load(f"{folder_path}/true.npy")
metrics = np.load(f"{folder_path}/metrics.npy")

print("Predictions:", pred.shape)
print("True:", true.shape)
print("Metrics:", metrics.shape)

mse = np.mean((true - pred) ** 2)
mae = np.mean(np.abs(true - pred))
print("MSE:", mse, "MAE:", mae)
```

---

## 🌍 My Contribution

I extended the official Autoformer implementation to forecast **daily CO levels** from the **UCI Air Quality Dataset**.

### 🔧 Steps

- **Dataset**:  
  - Used `air_quality1.csv` (13 features)  
  - Target: `"CO(GT)"`, daily frequency  
  - Cleaned missing values

- **Code Modifications** (`data_provider/data_loader.py`):

```python
class Dataset_Custom(Dataset):
    def __init__(self, root_path, flag='train', size=None,
                 features='M', data_path='air_quality1.csv',
                 target='CO(GT)', scale=True, timeenc=0, freq='d'):
```

- **Script**:  
  - Created `scripts/AirQuality_script/Autoformer_air_quality.sh`  
  - Trained for 2 epochs, predicting 96 time steps

### 🌱 Impact

- Showcased Autoformer’s ability to forecast **pollution levels**
- Useful for **environmental monitoring** and **public health**
- Key challenge: Proper frequency handling and data cleaning

Details documented in `contribution.txt`

---

## 📊 Results

| Dataset       | Samples | Features | MSE    | MAE    |
|---------------|---------|----------|--------|--------|
| Weather       | 10444   | 21       | 0.2812 | 0.3515 |
| Air Quality   | 1776    | 13       | 1.4926 | 0.7056 |

### 📌 Weather Dataset

- Folder: `results/weather_96_96_Autoformer_custom_ftM_sl96_ll48_pl96_*`
- Shapes:
  - `pred.npy`: (10444, 96, 21)
  - `true.npy`: (10444, 96, 21)
- Metrics: `(5,)` → MSE: **0.2812**, MAE: **0.3515**
- ✅ Matches original paper's performance

### 📌 Air Quality Dataset

- Folder: `results/air_quality_96_96_single_target_*`
- Shapes:
  - `pred.npy`: (1776, 96, 13)
  - `true.npy`: (1776, 96, 13)
- Metrics: `(5,)` → MSE: **1.4926**, MAE: **0.7056**
- 🔍 Shows room for tuning and further optimization

---

## 📜 License

This project is licensed under the **MIT License**, in alignment with the original [Autoformer repository](https://github.com/thuml/Autoformer).  
See the `LICENSE` file for more details.

---

