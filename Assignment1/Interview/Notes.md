### 1. **Introduction**
Our research focuses on the impact of **previous relationships** on **match rates** in online dating platforms. We used data from a simulated online dating dataset where we aim to understand how users' past relationship experiences might influence their success in finding matches. Additionally, we explore the influence of **questionable research practices (QRPs)**, particularly focusing on **p-value manipulation** and **sequential testing**. By doing so, we highlight the risks associated with these practices in scientific research.

### Why this approach?
- **Relevance**: Online dating is a growing topic, and understanding factors influencing success on platforms is useful for both researchers and companies.
- **Research Gap**: We aim to uncover potentially overlooked or misunderstood patterns that might affect user success.
- **Focus on QRPs**: This helps in understanding how data manipulation can lead to misleading conclusions, a key issue in modern research.

---

### 2. **Hypothesis**
We formed two hypotheses:
- **Null Hypothesis (H₀)**: There is no direct relationship between the number of previous relationships and the match rate.
- **Alternative Hypothesis (Hₐ)**: There is a relationship between the number of previous relationships and the match rate.

### Why this hypothesis?
- **Testable**: It's based on a common research question—whether past relationship experience affects current outcomes.
- **Linear Regression Model**: We chose a linear regression model because it allows us to explore the relationship between two continuous variables (previous relationships and match rate).

---

### 3. **Initial Data Simulation**
We used **random data generation** to simulate user data based on known parameters. 
- **Match rate**: Followed a normal distribution (mean = 10, SD = 15), but was truncated to between 0.5 and 65 to match realistic values.
- **Previous relationships**: Simulated as a truncated normal distribution (mean = 3, SD = 4), truncated between 0 and 12.
  
The data was then analyzed using a **linear regression model**.

### Why this simulation?
- **Fictitious yet realistic**: We generated synthetic data, which allowed us to control for the "true" relationship and observe how the method would perform under ideal conditions.
- **Model Choice**: A linear regression test was appropriate for examining the relationship between continuous variables (previous relationships and match rate).

---

### 4. **Initial Findings and Analysis**
We performed **10,000 tests** to analyze the relationship. The p-values obtained from each test were plotted in a histogram. Here's the initial conclusion:
- The histogram showed **uniform distribution** of p-values, confirming there was no real effect (as expected from the null hypothesis).
- The p-values mostly centered around the 0.05 threshold, indicating the correct Type I error rate.

### Why this step?
- **Statistical Validation**: The histogram allowed us to assess whether the simulation worked as expected, with p-values distributed uniformly between 0 and 1 (under the null hypothesis).
- **Type I Error Expectation**: The uniform distribution helps validate the **0.05 significance level**, where approximately 5% of tests are expected to be significant by chance.

---

### 5. **Introduction of Questionable Research Practices (QRPs)**

#### 5.1 **P-value Rounding**
We introduced a QRP: **rounding p-values above 0.05 down to 0.05**.
- This mimics a practice where researchers might adjust p-values to make their results appear statistically significant when they are not.

**Why this QRP?**
- **Common Manipulation**: Rounding p-values is a well-known manipulation in research.
- **Goal**: See how this affects the distribution of p-values and **Type I error rate**.

#### 5.2 **Sequential Testing with Optional Stopping**
In this QRP, we iteratively increased the sample size until the p-value became significant (p < 0.05).
- We started with a sample size of **280**, and for each test, we added **200 samples** until we either found a significant p-value or reached the maximum sample size of **5,280**.

**Why this QRP?**
- **Subtle Manipulation**: Unlike rounding p-values, this method is less obvious and harder to detect.
- **Effectiveness**: It increases the likelihood of finding a significant result, which can artificially inflate Type I errors.

---

### 6. **Visualizing QRPs**

#### **Charts Explanation**

##### **Chart 1: Initial Histogram of p-values**
This histogram shows the **distribution of p-values** under the null hypothesis (no real effect). The p-values are evenly distributed, as expected under correct statistical procedures.

- **Purpose**: To demonstrate the natural distribution of p-values under the null hypothesis.
- **Key Takeaway**: The p-values are spread uniformly, with most falling between 0.05 and 0.10, showing that there’s no effect (consistent with the null hypothesis).

##### **Chart 2: Histogram of p-values with Range 0.05 to 0.055 Rounded to 0.05**
This shows the distribution of p-values after rounding values between 0.05 and 0.055 to 0.05.
- **Purpose**: To visualize the effect of rounding p-values just above 0.05.
- **Observation**: The number of p-values at 0.05 increases significantly, indicating an inflation of Type I errors.

##### **Chart 3: Histogram of p-values with Range 0.05 to 0.06 Rounded to 0.05**
This chart demonstrates what happens when the rounding range is extended to 0.06.
- **Purpose**: To assess the impact of a broader rounding range.
- **Observation**: A larger spike at 0.05 shows a greater inflation of Type I errors.

##### **Chart 4: Histogram of p-values with Range 0.05 to 0.07 Rounded to 0.05**
- **Purpose**: Shows the effects of rounding an even wider range.
- **Observation**: The spike at 0.05 continues to grow, with fewer p-values distributed in the range between 0.05 and 0.07.

##### **Chart 5: Histogram of p-values with Range 0.05 to 0.09 Rounded to 0.05**
- **Purpose**: Illustrates the maximum rounding range (0.09).
- **Observation**: The leftmost bar (p-value = 0.05) becomes overwhelming, showing a drastic inflation of significant results.

##### **Chart 6: Histogram for Sequential Testing with Optional Stopping**
This histogram illustrates the effect of **sequential testing**, showing that the distribution of p-values now has a larger proportion in the significant region (p < 0.05).
- **Purpose**: To demonstrate how sequential testing increases the chance of reaching statistical significance.
- **Observation**: A significant increase in the number of tests where p < 0.05, leading to Type I error inflation.

##### **Chart 7: P-value Fluctuations for Sequential Testing**
- **Purpose**: To visually show how p-values fluctuate as the sample size increases.
- **Observation**: P-values fluctuate randomly at first, but eventually cross the 0.05 threshold, showing the manipulation of p-values through sample size increases.

---

### 7. **Conclusion**
- **Without QRPs**: The simulation of the p-value distribution under the null hypothesis showed no relationship between previous relationships and match rate, as expected. The p-values were uniformly distributed, confirming the null hypothesis.
- **With QRPs**: The introduction of rounding p-values and sequential testing inflated the number of p-values below 0.05, leading to **Type I errors** (false positives). This manipulation can cause misleading conclusions about the significance of relationships, significantly impacting research quality.
- **Implications**: This highlights the risks associated with QRPs in research, where data can be manipulated to give a false sense of statistical significance, ultimately leading to **irreproducible findings** and undermining the **integrity** of scientific research.