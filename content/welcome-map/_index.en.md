--- 
date: "2021-01-21T11:35:01+06:00" 
description: How the components fit together
icon: far fa-map-marked-alt
title: openMSE Map
type: welcome 
weight: 3 
---


<div class=col-9>

The `openMSE` packages use an object-oriented design. In essence this means that most functions take objects with an openMSE-specific class as arguments (e.g., `OM`) and return other objects with a different openMSE-specific class (e.g., `MSE`). 

You can learn more about [object-oriented design](https://adv-r.hadley.nz/oo.html), although this isn't required to use `openMSE`. 

More important, is an understanding how the various [openMSE objects](/#objects) relate together. This diagram shows how the various parts connect together. 

The colors indicate:

1. yellow: openMSE objects

2. green: openMSE functions that operate on the openMSE objects

3. blue: features of the openMSE framework.


Clicking on various parts of the diagram will take you to the relevant pages that explain the objects, functions, and features in more detail. 

</div>
<hr>

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2021-03-25T18:11:39.464Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36\&quot; etag=\&quot;Ps3cNdVYvCnm3qCEqUqI\&quot; version=\&quot;14.4.9\&quot; type=\&quot;google\&quot;&gt;&lt;diagram id=\&quot;aBsqhW0-vO5jqpX240pv\&quot; name=\&quot;Page-1\&quot;&gt;5V1bd6M2EP41fqSHu/FjNptse07TTZvT0+2jDLLNBhAFnMT76ytA4iqDsIUx3t2HmEGAmfnmopmRvNDu/Y8vEQh3T8iB3kKVnY+F9nmhqqplWPhPSjnkFEXR9JyyjVyH0ErCi/sDEqJMqHvXgXFtYIKQl7hhnWijIIB2UqOBKELv9WEb5NWfGoItbBFebOC1qf+4TrLLqZa6LOm/Qne7o09WzFV+xgd0MHmTeAcc9F4haQ8L7T5CKMk/+R/30Eu5R/mSX/d45GzxxSIYJDwXPP3heQ/BJ2n3J9g4VrxC27c3iX7bN+DtyRuTb5scKAsitA8cmN5FWWif3nduAl9CYKdn37HUMW2X+B45HScReoX3yEMRpgQowMM+bVzPo6SFqj3epf8xvf0K5K3eYJTAjwqJvNIXiHyYRAc8hJyVDMLeQx0376WwjCWh7aqCknVCBQQh2+LeJRPxB8LHITxVBPO0wT6Y/TvGawE8Xel1ni7bPFUtBk+10ViqL2fOUqPBUkU1Wjwt2FfDqTUWTxV15jxd9aJUWzE4qurGYI7+HcPo6/p76mBU2QNr6FUZ5rnBKz1+RNkwCYUwAokbbCU/d4qP+djCfCfGD/nxNfjxzbe+7H77+vy3gSTFrLwwkaEgaWw2G9W2W9LAZxxzbRpmegUKEuKAFQsfbyPguFg8tbs4K9MUIz7FMOoqYam/tJVCZRpvZfnLcCHiw4oce+RqeglhSU0G5n97RE9IccasOzxAWYYf5Un8aZv+fUmQ/UpvtY4omVLw98nvT8nHsBTn9+mHjzj0dKDkCK4oWj67Ef7OLgrw+RjtUzkKQYvZQMuqjRWWTzrBJV0cJ48ehMlgVGzyq3pRod4wKtSmDbkhVHxdx4MxgdJrehGh3TAimnai8PY3gIj7CIIEDgdFKxRRJTu9FSYhny8y0UcLTBwArQ0zMDFtC6437EBkCYEJZUGQUZuxeTuSVOSZYuY3PxwMGDe9pj/aEIiJqzMjTcdyWTPSTvYwBdCeFH+lqo7JJBnXmNHh908GZmwICXjuNuWyjbkKMf1Tyk3XBt4dOeG7jpM+hinsEg5yfaqh6vSYfElGYmuw+GiSkUjPYky2DdbUcLj0+rQ3DkFwlvaiqBoa5rc7rsC+5IAESJFr7zinnKsbtuxqK+tyUcvOmS5sp12gs4VUHbD8d2iLAuA9lNSGOpVjfkcoJNL4DpPkQJQM7BNUlxVmanT4ll6PZ9Lk8F9yu+zg80ft6ECOclnSVLiGKQ6IdwVCjgoN2+bIhh1AVEmlIAHRFiYdAw2i2ymTOkEQQQ/bwrd6Ip8l0ezSuygCh8qAELlBElfu/JwSKtknpY4tVTaq6Ogdb8idw/XO4fhD/n1LJBYvfkbiejkFEtuIugCItKVoEJ3oH86L7j5jYz84vHOyi3icQ87OqfKRY+cf5aZ3YIQJF4zx2CppTeIcPtyk4hvw0b+VM6VnSA+OO4bT1ZhqZ78aWzehxndh6KXf8un5nGzxBk/p9xGMJR8EYAt9zHYpjJANnZSKB0T7IMjmBjy6n8vgRgNDRdYa3tto6z4zMjRnMOf/C9qDnUKUXtMPip/KIRRzxCua9Gushg1iM0r5g/Q+jy4OzLMXbIQJ6zocrj47IEC2VqNYPGJGgE+OOoccnwo7jgc+Vyz5zyzJVieF3lbSeSR37lHguFnqcnB+J03kR1ktgMeVG7ecvdfMGeR4WB1hwzw95hKrRvjU6eivzh6IkHej4U/V2vJmNVKNoP6TVPPI7D1E4d4jqf6GDWAiUGDN9+pMwGo5qQm4shJADSZudjU3Sm7ZUSjy6qphcmavGfSyOwtLFqz3roeBw4ebW84VGE3YMOYOs7UuLSfUY116YWPv4wT5fhjzAWe8fML0wFkqkwKHM8FstkLFCyaY6ees8lgkm9kJ5rJiuajWK8vyJXfF8qhsq4lpJrfIpH2C8pKYGqU5rEZJ0yQnVh2Pma40zT3csnBYkxF7GQxoOTrLmljqWjM52+dXS0deLsVYF7Mx772WRsdeIfX0jW2xmEJ+/hQr/8Ca3kHu5JtVZ5umai22FbX3WuJfTOafM19AZHkta3M6BDlosV4jlGJN3ZkLy7ThvOdjNF2GdRv11U4x9TdPmJzeTRXegTNJAubF9dMUCo5+y1KJCfxUc4J1HC6G1F4TLOPIBR5+aHZTFwWScwiA79pxFlUj5EmpXeNquxhvGZjwqFiQZVAbPdiMytuI5VhOWzFpqDzEVohr7hNuY3ReG7Oa2Mb86sZJU9FJbm1XnOpW4/GyaaOv5hSl1o02C4Xh8adusVJWU6h1XdVSSq2PttD62gR52T1DFq6s3NNd7ULKymmoJ+ljvdKgjluG8k0Edc8R+l5JhJd9dGWId3KDXU+QF+aPzgr6XGHejJZejBTmKauLxnlHE1IvDwxxE2/vx5xtFpo8mjzn6u9Zm3Kw/P0cuior08VqP90IhmQLg6y7Z0Cnvjaj+r4grC3ra/yuc8pICwsTre2qV0rUvlJJLQRtR6iiYxOdO+E09WRQ2Fpsj7Rznr0nTLZGm2vl/s+XTGpYBlaH6Gx7+0de8aVNmrOYJGYpzFBR9Ly+HEWxh+RF/ciF3QHNIvRPVS9Vf+BsoeAo1h2pag6DMH+tk9bXGFBm98Ybw8HMuXOj6A1Gx6hkFhLsNxp9+zWOx0l6464VI88w2qDIB4GdTlOe8HOzGcUNrRc5V340JphuR5CJ+jyxQGzSMS6FVZg8hr6E32mHHM4uG0PgPoOTRJQD4EJ7QOtpDZMzoLzpDtDjgMp7QKvEFGC5KeICmPrTAUxZXiPCnp9OAwCPjEdMWI3dqydK5hz7zs11q8KXve+DstrS76feoWfj15CA9N/etV+lBM8WMBl+AN9NNy2QMOL2XsJrQeae9DjbRSmM0H+2PurZQwNWQAmG0ozWtozkjC6MJc5Zt9aaw1wytV4ciFuEcGb2hPC+mj3p8LwisyfZpUPXJmitXuDuDdGa4436z50MXZvA2Rs0+x3RFO4ai3kVsGj+qgNt/T4KC6Nz/DiwUKe1PY2uTqXH9gxO43Jv02VwYksTjq0Zb9PVU/wH6UMk3upeLoJ5RCcnbN9at/hKe6nO9BV+6p+vuzLDrdK87kK/DZU+eas0LuWc9Od8Rt4trbHFtq63lXPyqqk6iZtm9gEXrb+DFmxM59p512nQGOBKarF05tpVJKMEt0ng3otJ7+gPrO/nVbcoBbn16BnU5sQ7dEZfjqCdm/j24KNhfBdYKpsoFjHabEQ2wvZ7jZy1tmqb/WKMaCGyNX7aFssR8kCiN6MQ3z150szeaPaG92xG0RxvkAjjxJk9Pix/azcfXv5ksfbwPw==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>


<hr>

