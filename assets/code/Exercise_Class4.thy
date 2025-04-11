theory Exercise_Class4
imports "HOL-IMP.Small_Step"
begin


text \<open>This exercise sessions has two parts

1. Inductive definitions
2. Operational semantics
\<close>

section \<open> Inductive Definitions \<close>

text\<open> Write an inductive definition which tests if a list is a palindrome
( i.e. the same list if reversed ) You may find it useful to remember the append 
function. The definition will likely need three cases. \<close>
inductive palindrome :: "'a list \<Rightarrow> bool" where
empty: "palindrome []" 
(* finish the definition above *)

text \<open> Prove the following basic facts on palindromes. Remember to use 
the custom induction rule. You can see this via typing "thm palindrome.induct" \<close>
lemma "palindrome xs \<Longrightarrow> rev xs = xs"
  oops

lemma "palindrome xs \<Longrightarrow> last xs = hd xs"
  oops

text\<open> Semantics \<close>

text \<open>The exercises in this section are based on the exercises from Chapter 7 of the
Concrete Semantics Textbook (Nipkow & Klein, 2014). 
Please see the website here for more info: http://concrete-semantics.org/ \<close>

text \<open>
Define a function that computes the set of variables that could be assigned to
in a command:
\<close>

fun assigned :: "com \<Rightarrow> vname set" where
"assigned SKIP = {}" 
(* finish the definition here *)

text\<open>
Prove that if some variable is not assigned to in a command,
then that variable is never modified by the command:

Note we are using the big step semantics (=>) in the lemma below.

Remember to use the big step semantics inductive definition
\<close>

lemma "\<lbrakk> (c, s) \<Rightarrow> t; x \<notin> assigned c \<rbrakk> \<Longrightarrow> s x = t x"
  oops

text \<open>
Define a recursive function  that determines if a command behaves like @{const SKIP}
and prove its correctness in the lemma that follows: 

For example SKIP ;; SKIP would behave like SKIP, but While b DO SKIP would not (could loop), 
and neither would an assign statement  
\<close>

fun skip :: "com \<Rightarrow> bool" where
"skip SKIP = True"

(* finish the definition above, and proof below *)

lemma "skip c \<Longrightarrow> c \<sim> SKIP"
  oops

text\<open>
Define a recursive function that eliminates as many @{const SKIP}s as possible from a command. For example:
@{prop[display]"deskip (SKIP;; WHILE b DO (x::=a;; SKIP)) = WHILE b DO x::=a"}
\<close>

fun deskip :: "com \<Rightarrow> com" where
"deskip c = c"

text\<open>
Prove its correctness by induction on @{text c}: 

Remember lemma @{thm[source]sim_while_cong} for the @{text WHILE} case.\<close>

lemma "deskip c \<sim> c"
  oops
(* your definition/proof here *)

text\<open>
Prove the following equivalence for WHILE which uses the new 
Or construct defined below:
\<close>

definition Or :: "bexp \<Rightarrow> bexp \<Rightarrow> bexp" where
"Or b\<^sub>1 b\<^sub>2 = Not (And (Not b\<^sub>1) (Not b\<^sub>2))"

lemma "WHILE Or b\<^sub>1 b\<^sub>2 DO c \<sim>
          WHILE Or b\<^sub>1 b\<^sub>2 DO c;; WHILE b\<^sub>1 DO c" (is "?w \<sim> ?w ;; ?v")
  oops


text \<open> Define a basic locale for an abstract big step semantics 
in the style of the small step example from the lectures. 

Show the IMP big step semantics are an interpretation of this \<close>

end

