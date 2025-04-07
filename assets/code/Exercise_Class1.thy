theory Exercise_Class1 imports Logic_Ex Function_Ex Complex_Main
begin


(* This exercise class is all about getting familiar with using Isabelle/HOL. 
There are four sections:
1. Getting familiar with basic natural deduction proofs in Isabelle
2. Using tools such as FindFacts and Sledgehammer
3. Writing functions and using induction in Isabelle
4. Writing definitions (Set theory) and reasoning on more mathematical properties.
(5). More function questions ... if you have time!

You don't need to finish every exercise in order, e.g. if you're comfortable with 
natural deduction proofs after one or two, move onto the next section!

*)

(* 1. LOGIC *)

(* Complete the proofs of some of the logical statements below in the apply proof style
Only use the rule, erule, intro, elim, and assumption tactics OR when you suspect the statement may be 
false try out nitpick and quickcheck to find a counter example. 

For a summary of the useful logic lemmas - check the example theory from the lecture (Logic_Ex.thy)
You can also use the facts proved in that theory 

*)

(* More propositional logic proofs *)
lemma conj_assoc1: "p \<and> (q \<and> r) \<longrightarrow> (p \<and> q) \<and> r"
  oops

lemma conj_curry: "((P \<and> Q) \<longrightarrow> R) = (P \<longrightarrow> (Q \<longrightarrow> R))"
  oops

lemma pierce: "((p \<longrightarrow> q) \<longrightarrow> p) \<longrightarrow> p"
  oops

(* Predicate Logic *)
lemma "(\<forall>x. P x \<or> Q x) = ((\<forall>x. P x) \<or> (\<forall>x. Q x))"
  oops

lemma "(p \<longrightarrow> q) \<longrightarrow> (q \<longrightarrow> (r \<and> s)) \<longrightarrow> (r \<longrightarrow> \<not> s) \<longrightarrow> \<not> p"
  oops


lemma "(\<exists>x. P x \<and> Q x) = ((\<exists>x. P x) \<and> (\<exists>x. Q x))"
  oops


lemma forall_conj: "(\<forall>x. P x \<and> Q x) = ((\<forall>x. P x) \<and> (\<forall>x. Q x))"
  oops


(* 2. SLEDGEHAMMER and FINDFACTS *)
(* Solve the following using sledgehammer *)

lemma "continuous_on X f \<Longrightarrow> Y \<subseteq> X \<Longrightarrow> Z \<subseteq> Y \<Longrightarrow> continuous_on Z f"
  oops

lemma real_sqrt_le_iff': "x \<ge> 0 \<Longrightarrow> y \<ge> 0  \<Longrightarrow> sqrt x \<le> y \<longleftrightarrow> x \<le> y^2"
  oops

lemma sin_cos_squared_add3:
  fixes x:: "'a:: {banach,real_normed_field}"
  shows "x * (sin t)^2 + x * (cos t)^2 = x"
  oops


(* Try out FindFacts on an area of maths/CS you're interested in! *)

(* 3. FUNCTIONS AND INDUCTION *)

(* Note, natural numbers are defined as a datatype such as this: datatype nat = 0 | Suc nat  *)
value "1 + (2::nat)"

value "1 - (2::nat)"

value "1 - (2:: int)"

(* Write a function that adds two numbers together recursively *)
fun add :: "nat \<Rightarrow> nat \<Rightarrow> nat" where
"add 0 n = n" |
"add (Suc m) n = Suc (add m n)"

(* Prove addition associativity and commutativity properties.
You may need helper lemmas *)
lemma add_assoc: "add l (add m n) = add (add l m) n"
  oops

lemma add_commute: "add m n = add n m"
  oops


(* Write a function that doubles a natural number *)

fun double :: "nat \<Rightarrow> nat" where
"double 0 = 0" |
"double (Suc m) = Suc (Suc (double m))"

(* Show double m should be equal to adding m to itself (using the add function) *)
lemma double_add: "double m = add m m"
  oops

(* Finish the datatype definition below so it defines a datatype with a leaf (Lf)
and a branch (Br) which has a node and two branches.  *)

datatype 'a bt = Lf

(* Finish defining a function that will reflect the tree *)
fun reflect :: "'a bt \<Rightarrow> 'a bt" where
"reflect Lf = Lf" 

(* declare [[simp_trace]] *)

lemma reflect_reflect_ident: "reflect (reflect t) = t"
  oops
(* Find a counter example for reflect t = t using counter example generator *)
lemma "reflect t = t"
  oops

(* 4. MATHEMATICAL DEFINITIONS - SETS *)
(* Use a definition to state the following *)

(* for an arbitrary set, define the set of all subsets of size 2. You might 
find the Set theory a good starting point! *)

definition nsubsets :: "'a set \<Rightarrow> nat  \<Rightarrow> 'a set set" where
"nsubsets A n = {}"

(* Prove the following basic definitions via the definition *)
lemma nsubsets_card: "a \<in> nsubsets A n \<Longrightarrow> card a = n"
  oops

lemma nsubsets_ss:  "a \<in> nsubsets A n \<Longrightarrow> a \<subseteq> A"
  oops


lemma nsubsets_empty: "A = {} \<Longrightarrow> n > 0 \<Longrightarrow> nsubsets A n = {}"
  oops

(* The following lemma doesn't work. In Isabelle card A = 0 when 
the set is empty OR the set is infinite. Add an assumption to avoid the latter
and finish the proof. *)
lemma nsubsets_zero: "nsubsets A 0 = {{}}"
  oops

(* Sometimes we want to extract elements of a set. A simple example is the_elem, which 
extracts the single element present in a singleton set (i.e. card = 1), which is defined
in isabelle as the is_singleton definition.

Prove a basic injectivity property of these two definitions *)

lemma inj_on_the_elem: "is_singleton X \<Longrightarrow> is_singleton Y \<Longrightarrow> the_elem X = the_elem Y \<Longrightarrow> X = Y"
  oops

(* To show the cardinality of two sets is equal, a useful strategy is using the
bij_betw_same_card lemma. See if you can use it to show the following lemma. 
You may find it useful to define more helper lemmas on the_elem and is_singleton *) 

thm bij_betw_same_card

lemma nsubsets_one: "card (nsubsets A 1) = card A"
  oops

(* 5. EXTRAS *)

(* Prove the following lemma. algebra_simps might be useful *)

lemma 
  fixes c :: "real"
  shows "finite A \<Longrightarrow> (\<Sum>i \<in>A . c * f i) = c * (\<Sum> i \<in> A . f i)"
  oops

(* Extras: define a function that adds a separator to a list
e.g. sep 1 [2,3,4] = [2,1,3,1,4]. Remember the order
of cases in your function determine the order in which Isabelle tries to 
pattern match! *)

fun sep :: "'a \<Rightarrow> 'a list \<Rightarrow> 'a list" where
"sep a xs = xs"

thm sep.induct

(* Prove the following lemma - you may find seps induct lemma useful! *)

lemma "map f (sep x ys) = sep (f x) (map f ys)"
  oops

(* Write a function to represent the fibonacci numbers *)

fun fib :: "nat \<Rightarrow> nat"
  where
"fib 0 = 1"

end