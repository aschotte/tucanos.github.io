# Riemannian metrics

# Riemannian metric & unit mesh

- A Riemanian metric is a symmetric positive definite (SPD) tensor field $\mathcal M(\mathbf x)$, defined everywhere in the computational domain, such that the length of an edge $\mathbf y - \mathbf x$ is given by
$$\ell_{\mathcal M}(\mathbf y - \mathbf x) = \|\mathbf y - \mathbf x\|_{\mathcal M} = \int_0^1 \sqrt{(\mathbf y - \mathbf x)^T \mathcal M((1- t) \mathbf x + t \mathbf y)(\mathbf y - \mathbf x)} dt $$
- A metric field locally defines geometric quantities as lengths or volumes as well as a local orientation.
- A metric field can be used to generate a unit mesh with respect to this metric
    - the objective is to have $\ell_\mathcal M(\mathbf e) \approx 1$ for all the edges $\mathbf e$ in the mesh

# Metric: local sizes and directions

- The metric is a SPD tensor: it can be characterized locally by its eigenvalues $(s_1, \cdots, s_d)$ and an orthonormal basis of eigenvectors $(\mathbf v_1, \cdots, \mathbf v_d)$
- $\mathbf e_ih_i \mathbf v_i$ with a local size $h_i = 1 / \sqrt{s_i}$ are unit edges in metric space (if $\mathcal M$ is constant over $\mathbf e_i$ )    
- In order to generate an isotropic mesh with local size $h(x)$, the metric should be $\mathcal M(x) = diag(1/h^2(x), \cdots, 1/h^2(x))$  

# Metric complexity

- The physical volume of and equilateral element with unit edges in the (uniform) metric space (i.e. ideal elements) in $d$ dimensions is 
$$ \frac{v_{\Delta}^{(d)}}{\sqrt{\det(\mathcal M)}} \equiv v_{\Delta}^{(d)} \mathcal V(\mathcal M)$$
where $\mathcal V(\mathcal M)$ is the volume associated with metric $\mathcal M$  and $v_{\Delta}^{(d)} = \frac{\sqrt{d+1}}{d!\sqrt{2^d}}$
- The number of ideal elements per unit physical volume is thefore $1/\left(v_{\Delta}^{(d)} \mathcal V(\mathcal M)\right)$ so the ideal elements to fill a domain $\Omega$ is 
$$\frac{1}{v_{\Delta}^{(d)}} \int_\Omega \sqrt{\det(\mathcal M)} dx$$
- $\mathcal C(\mathcal M) = \int_\Omega \sqrt{\det(\mathcal M)} dx$ is called the metric complexity

# Discrete metric field

- In the context of remeshing, a metric $\mathcal M_i$ is defined at each vertex $\mathbf x_i$ of the input mesh
- The length of an edge $\mathbf e_{i,j} = \mathbf x_j - \mathbf x_i$ is computed assuming a geometric variation of the local size along the edge:
$$  l_\mathcal M(e_{i,j}) = l_i \frac{a - 1} { a \ln(a)} $$ 
with $l_k = \sqrt{e_{i,j}^T \mathcal M_k e_{i,j}}$ and $a = l_j / l_i$.

# Element quality in metric space

- The quality of an element in metric space is given by 
$$q(K) = \beta_d \frac{|K|_{\mathcal M}^{2/d}}{\sum_e ||e||_{\mathcal M}^2}$$ 
- The normalization factor $\beta_d$ is a such that $q = 1$ of equilateral elements: 
    - $\beta_2 = 1 / (6\sqrt{2})$
    - $\beta_3 = \sqrt{3}/ 4$
- Among the metrics defined at all the vertices of element $K$, the one with minimum volume is used in the formula above

> Invalid elements have a quality $q < 0$
