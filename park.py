import os
import pandas as pd
import statsmodels.api as sm
from io import StringIO

def LM(X, Y):
    X = sm.add_constant(X)
    model = sm.OLS(Y, X)
    model_result = model.fit()
    p_values = model_result.summary().tables[1].as_csv()
    tmp = StringIO(p_values)
    p_values_df = pd.read_csv(tmp, sep=',', skipinitialspace=True)
    p_values_df = p_values_df.rename(columns = {"Unnamed: 0" : "Variable"})
    p_values_df = p_values_df.rename(columns = {"P>|t| " : "P"})
    print(p_values_df)
    return p_values_df

def main():
    # Reading the Data
    data = pd.read_csv('a1_data.csv')
    variance = data.var()

    # Initializing the adjancency matrix with all zeros
    column_names = data.columns.tolist()
    out_data = pd.DataFrame(0, index=column_names, columns=column_names)

    # Going across each feature(variable) in the dataset
    for col in data:
        data2 = data.drop(col, axis=1)
        # calculating the p-value for each feature by running the linear regression using the other features - 
        # for example, for variable A - the regressors are B, C, D,..., K
        # and we get the p-value for each variable to get the significance.
        p_values_df = LM(data2, data[col])

        # Extracting the edges which have a p_value lesser than 0.05 (5%, standard)
        # to get the variables which have some correlation to the target regressor ('A' in this case)
        no_edge = p_values_df.query('P < 0.05')['Variable']
        for val in no_edge.values:
            if val == 'const':
                continue
            val = ''.join(val.split())

            # If var(A) < var(D)
            #   then A -> D
            # else
            #   A <- D
            if variance[col] < variance[val]:
                out_data.loc[col, val] = 1
            else:
                out_data.loc[val, col] = 1

    print(out_data)

if __name__ == "__main__":
    main()