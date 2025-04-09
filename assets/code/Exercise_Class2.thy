theory Exercise_Class2 imports Main
begin

(* There are three sections to today's exercises:
1. Isar Exercises: Good to get practice using the Isar proof language, and 
continue to get familiar with useful tactics etc.
2. Locales: Defining a graph using locales - make sure you at least try this
to help with future lectures!
3. Type classes: If time allows, try using type classes to define some orderings. 
*)

(* 1. Isar exercises *)

(* Prove one or two of the following using the Isar proof language. 
You may find algebra_simps useful, and the obtains 
keyword. Structure the proof like you would on paper! 
 *) 

lemma fixes a b :: int assumes "b dvd (a + b)" shows "b dvd a"
  oops


lemma "(k dvd (n + k)) = (k dvd (n :: nat))" 
oops


(* Hint: To refer to the inductive hypothesis (for nats), use Suc.IH *)
lemma " (\<Sum>i\<le>n. 2*i - 1) = n^2" for n::nat
  oops


(* 2. LOCALES: Graph theory *)

(* We'll be defining an undirected graph using a set-based definition
i.e. edges are sets of size 2. For simplicity, loops are not allowed. 
We'll start with the locale definition. If you have time, try seeing how this
would work with records/type classes as well! *)

(* Use a type synonym to define a generic edge type ('a edge) which is just a set with elements of type 'a *)

type_synonym 'a edge = "'a set"


(* Now finish the below locale definition for a graph, there should be two assumptions
for an edge to be "valid" *)

locale graph = 
  fixes V :: "'a set" 
  fixes E :: "'a set set"

(* Define a graph with a finite number of vertices (direct inheritance) *)
locale finite_graph = graph

(* Define a graph with a finite number of edges (direct inheritance) *)

locale finite_edge_graph = graph

(* Show a finite graph is a sublocale of a finite edge graph using a 
sublocale declaration and the unfold_locales tactic *)

sublocale finite_graph \<subseteq> finite_edge_graph
  oops

(* Global interpretation*)

(* A complete graph is one where there is an edge between every possible pair of vertices *)
(* Finish the definition below to define a set representing all possible edges *)


(* Now set up a global interpretation labelled 
completeG of the graph locale with the 
parameters vertex set V and edge set "all_edges V" *)

interpretation completeG: graph V "all_edges V"
  oops


(* In the graph locale context add a definition for the neighbourhood of a vertex x, i.e. 
all vertices y where there is an edge between x and y *)
definition (in graph) vert_adj :: "'a \<Rightarrow> 'a \<Rightarrow> bool" where 
"vert_adj v1 v2 \<equiv> True"

definition (in graph) neighborhood :: "'a \<Rightarrow> 'a set" where 
"neighborhood x \<equiv> {}"

context graph
begin

(* Show the complement of a graph (i.e. with vertex set all_edges V - E) is still 
a well formed graph via an interpretation *)
interpretation GC: graph V "(all_edges V - E)"
  oops

(* Show that if x is in the neighbourhood of y, then x is not in the neighbourhood of the graphs complement *)
lemma "x \<in> neighborhood y \<Longrightarrow> x \<notin> GC.neighborhood y"
  oops

(* Define more properties if you like! E.g. degree etc) *)

definition degree :: "'a \<Rightarrow> nat" where
"degree x = card (neighborhood x)"

end

(* 3. TYPE CLASSES *)


no_notation less_eq  ("(_/ \<le> _)"  [51, 51] 50) and  less  ("'(<')") and  less  ("(_/ < _)"  [51, 51] 50) and greater_eq (infix "\<ge>" 50) and greater  (infix ">" 50)

(* Below is a class representing a partial order, show an instantiation for integers, 
uncommenting the framework set out. *)
class partial_order =
  fixes le :: "'a \<Rightarrow> 'a \<Rightarrow> bool" (infixl "\<sqsubseteq>" 70) (* Param - binary predicate *)
  assumes refl [intro, simp]: "x \<sqsubseteq> x" (* Implicitly universally quantified *)
      and anti_sym [intro]: "\<lbrakk> x \<sqsubseteq> y; y \<sqsubseteq> x\<rbrakk> \<Longrightarrow> x = y"
      and trans [trans]: "\<lbrakk> x \<sqsubseteq> y ; y \<sqsubseteq> z \<rbrakk> \<Longrightarrow> x \<sqsubseteq> z"

(* instantiation int :: partial_order
begin

definition le_int_def : "(i \<sqsubseteq> j) = (i \<le> (j ::int))"

instance proof
  oops


end *)

context partial_order
begin
definition is_inf where
"is_inf x y i = (i \<sqsubseteq> x \<and> i \<sqsubseteq> y \<and> (\<forall> z. z \<sqsubseteq> x \<and> z \<sqsubseteq> y \<longrightarrow> z \<sqsubseteq> i))"

definition is_sup where
"is_sup x y s = (x \<sqsubseteq> s \<and> y \<sqsubseteq> s \<and> (\<forall> z. x \<sqsubseteq> z \<and> y \<sqsubseteq> z \<longrightarrow> s \<sqsubseteq> z))"


(* Finish the theorems below on the above inf/sup definitions.

Hint: remember to unfold the definition! *)
theorem is_inf_uniq: "\<lbrakk>is_inf x y i; is_inf x y i'\<rbrakk> \<Longrightarrow> i = i'"
  oops

theorem is_sup_uniq: "\<lbrakk>is_sup x y s; is_sup x y s'\<rbrakk> \<Longrightarrow> s = s'"
  oops
end

(* A lattice extends a partial order, and defines the meet and join operations  *)
class lattice = partial_order + 
  assumes ex_inf: "\<exists> inf. is_inf x y inf"
and ex_sup: "\<exists> sup. is_sup x y sup"
begin

definition meet (infixl "\<sqinter>" 70) where
"x \<sqinter> y = (THE inf. is_inf x y inf)"

definition join (infix "\<squnion>" 65) where
"x \<squnion> y = (THE sup. is_sup x y sup)"

end

(* Define a class representing a total order. I.e. a class that extends
partial_order to assume that for every pair of elements either 
x \<sqsubseteq> y \<or> y \<sqsubseteq> x *)
class total_order = partial_order

(* Un comment the line below and finish the subclass proof *)
subclass (in total_order) lattice
  oops

(* Show integers are an instance of the lattice class *)


end
