### **1. Can you briefly summarize your research and what you were trying to investigate?**

**Answer:**
Our research aimed to explore the relationship between **previous relationships** and **match rates** on an online dating platform. We wanted to understand whether a user's past relationship history influences their success in finding matches. Alongside this, we introduced **questionable research practices (QRPs)** to simulate how such practices, like **rounding p-values** and **sequential testing**, could distort the results and inflate the number of false positives in statistical tests.

---

### **2. What was your research question and hypothesis?**

**Answer:**
Our research question was: *Does the number of previous relationships a user has impact their match rate on an online dating platform?*

- **Null Hypothesis (H₀)**: There is no significant relationship between the number of previous relationships and match rate.
- **Alternative Hypothesis (Hₐ)**: There is a significant relationship between the number of previous relationships and match rate.

We performed a **linear regression** to test this hypothesis and determine whether any correlation exists between these two variables.

---

### **3. Can you explain the reasoning behind the hypothesis you chose?**

**Answer:**
We chose these hypotheses based on the notion that the number of previous relationships could either positively or negatively affect a user's success in finding matches. We hypothesized that:
- **Positive**: More relationships could lead to better interpersonal skills, increasing attractiveness.
- **Negative**: Many relationships could signal commitment issues, potentially making users less appealing.
By using a **linear regression**, we tested if the data supports either hypothesis or shows no relationship at all (i.e., the null hypothesis).

---

### **4. Why did you choose to simulate data for this project?**

**Answer:**
We decided to simulate the data to control for all possible factors and create a clear baseline where we already know the "truth." By simulating the data:
- We could ensure that the null hypothesis (no relationship between variables) was true.
- We could generate data that met realistic conditions but wasn’t biased by actual datasets.
This allowed us to test the performance of the statistical methods and examine how QRPs influenced the results without being swayed by real-world data noise.

---

### **5. Can you explain the concept of "questionable research practices" (QRPs) and why you chose to focus on them?**

**Answer:**
**QRPs** are unethical or misleading practices that researchers may use to achieve desired results. For example, **p-hacking** (manipulating data to get statistically significant results) or **sequential testing** (increasing sample size until significant results are found) can cause misleading conclusions.

We focused on QRPs because:
- **Rounding p-values**: This is a common practice where researchers alter results to make them appear significant when they are not.
- **Sequential testing**: This manipulates the data by continuing to add samples until the p-value is below the threshold, inflating significance.
By showing how these practices can distort statistical tests, we highlighted their impact on research integrity.

---

### **6. How did you simulate p-values, and what did the histogram tell you about your initial test?**

**Answer:**
We simulated p-values by running **10,000 tests** using **linear regression** on simulated data. The p-values from each test were plotted in a histogram.

- The histogram showed **uniform distribution** of p-values between 0 and 1, which is what we expected under the null hypothesis (i.e., no relationship between the variables).
- The p-values were randomly distributed with a small peak around 0.05, showing the typical significance threshold for hypothesis testing.

---

### **7. What was the purpose of rounding p-values in your analysis, and how did it affect the results?**

**Answer:**
Rounding p-values is a common QRP where values slightly above 0.05 (e.g., 0.056) are changed to 0.05 to make them appear significant. This manipulates the results and inflates the **Type I error rate**, leading to false positives. 

- **Effect**: As we rounded p-values between **0.05 and 0.06**, we saw an **increase in the number of p-values at 0.05**. This gave the illusion that more tests were statistically significant, even though there was no real effect.
- **Impact**: This practice makes the results seem more robust than they truly are, contributing to the **misleading conclusion** that an effect exists when it doesn't.

---

### **8. Can you explain the impact of sequential testing and optional stopping on your p-value distribution?**

**Answer:**
In sequential testing, we started with a sample size of **280** and iteratively increased it by **200** samples until the p-value was significant (p < 0.05) or we reached the maximum sample size (5,280). 

- **Effect**: This method inflated the likelihood of finding a significant p-value even when no true effect existed. 
- The **p-value distribution** showed a large concentration of significant results (p < 0.05), which were the result of stopping the test once a significant result was achieved, even if it was artificially induced by increasing the sample size.

---

### **9. How did you visualize the effect of QRPs in your report?**

**Answer:**
We used **histograms** to visualize the p-value distributions:
- **Initial Histogram**: Showed the p-values under the null hypothesis (no effect).
- **QRPs (Rounding)**: We tested different rounding ranges (e.g., 0.05 to 0.06, 0.05 to 0.07) and observed how the spike at **p = 0.05** grew as we increased the range for rounding.
- **QRPs (Sequential Testing)**: Showed the increased number of significant results after applying sequential testing, highlighting how p-value manipulation increases false positives.

---

### **10. What do these results mean for scientific research and what is the danger of QRPs?**

**Answer:**
These results demonstrate how **QRPs** can **distort scientific findings**, leading researchers to falsely claim significance:
- **Inflated Type I errors**: By manipulating p-values, QRPs lead to more findings that appear statistically significant than is actually the case.
- **Misleading conclusions**: This can misguide future research and create a **replication crisis**, where studies cannot be reproduced or verified.
- **Integrity of research**: Researchers must be careful not to manipulate data or results to fit desired outcomes, as it compromises the **trustworthiness** and **validity** of scientific work.

---

### **11. How would you prevent these QRPs in a real research setting?**

**Answer:**
To prevent QRPs in real research:
- **Pre-registration**: Researchers should pre-register their hypotheses, analysis methods, and data collection plans to prevent **p-hacking**.
- **Transparency**: Full disclosure of all data and methodologies allows others to verify findings.
- **Strict adherence to protocols**: Following strict statistical protocols can prevent the manipulation of p-values and sample sizes to achieve significant results.

---

### **12. What do you think is the most important takeaway from this project?**

**Answer:**
The key takeaway is that **QRPs** significantly **distort the results** of statistical tests, leading to **false positives** and unreliable conclusions. It’s crucial for researchers to **avoid these practices** and maintain **integrity** in data analysis to ensure that scientific findings are reproducible and trustworthy.
