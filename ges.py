# Usage
# python3 ges.py

# import libraries
import cdt
import networkx as nx
import pandas as pd
import matplotlib.pyplot as plt

# load data
df = pd.read_csv('a1_data.csv')

# Get skeleton graph
# initialize graph lasso
glasso = cdt.independence.graph.Glasso()
# apply graph lasso to data
skeleton = glasso.predict(df)
print(skeleton)

# GES algorithm
model_ges = cdt.causality.graph.GES()
graph_ges = model_ges.predict(df, skeleton)
# graph_ges = model_ges.predict(df)
ges_mat = nx.to_scipy_sparse_array(graph_ges)
print(ges_mat.toarray())

# visualize network
fig=plt.figure(figsize=(15,10))
nx.draw_networkx(graph_ges, font_size=18, font_color='r')
plt.savefig("Graph_wo_glasso.png", format="PNG")
