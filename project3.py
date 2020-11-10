from sklearn.cluster import SpectralClustering
from sklearn.metrics import pairwise_distances
from sklearn.preprocessing import MinMaxScaler
import numpy as np
from plotnine import *
import pandas as pd

#Import counts data and keep only variables of species counts
counts = pd.read_csv("derived_data/counts_area_sl.csv");
counts2 = counts.drop(['Park.Name', 'Park.Code', 'State', 'Acres', 'Latitude', 'Longitude', 'Size', 'LatCat2'], axis=1);

#Create histogram of pairwise distances
mms = MinMaxScaler();
normed = mms.fit_transform(counts2)
distances = pairwise_distances(normed)
(ggplot(pd.DataFrame({"distance":distances.reshape(np.product(distances.shape))}), aes("distance")) + geom_histogram())

#Do dimensionality reduction with TSNE (for 2,3, and 4 clusters)
from sklearn.manifold import TSNE

#2 clusters
adj = distances < 0.5
sc = SpectralClustering(2,affinity="precomputed")
counts2['cluster'] = sc.fit_predict(adj);
projection = TSNE(n_components=2).fit_transform(normed);
lowd2 = pd.DataFrame(projection, columns=["X1","X2"]);
lowd2["cluster"] = counts2["cluster"];
(ggplot(lowd2,aes("X1","X2")) + geom_point(aes(color="cluster")))

#3 clusters
adj = distances < 0.5
sc = SpectralClustering(3,affinity="precomputed")
counts2['cluster'] = sc.fit_predict(adj);
projection = TSNE(n_components=2).fit_transform(normed);
lowd3 = pd.DataFrame(projection, columns=["X1","X2"]);
lowd3["cluster"] = counts2["cluster"];
(ggplot(lowd3,aes("X1","X2")) + geom_point(aes(color="cluster")))

#4 clusters
adj = distances < 0.5
sc = SpectralClustering(4,affinity="precomputed")
counts2['cluster'] = sc.fit_predict(adj);
projection = TSNE(n_components=2).fit_transform(normed);
lowd4 = pd.DataFrame(projection, columns=["X1","X2"]);
lowd4["cluster"] = counts2["cluster"];
(ggplot(lowd4,aes("X1","X2")) + geom_point(aes(color="cluster")))

#Write results to CSV file to use in R markdown
lowd2.to_csv('derived_data/lowd2.csv')
lowd3.to_csv('derived_data/lowd3.csv')
lowd4.to_csv('derived_data/lowd4.csv')