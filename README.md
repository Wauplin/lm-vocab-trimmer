[![license](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/asahi417/lm-vocab-trimming/blob/master/LICENSE)
[![PyPI version](https://badge.fury.io/py/vocabtrimmer.svg)](https://badge.fury.io/py/vocabtrimmer)
[![PyPI pyversions](https://img.shields.io/pypi/pyversions/vocabtrimmer.svg)](https://pypi.python.org/pypi/vocabtrimmer/)
[![PyPI status](https://img.shields.io/pypi/status/vocabtrimmer.svg)](https://pypi.python.org/pypi/vocabtrimmer/)

# Vocabulary Trimming: An Efficient Multilingual Language Model Compression

<p align="center">
  <img src="https://raw.githubusercontent.com/asahi417/lm-vocab-trimming/master/assets/overview.png" width="400">
  <br><em> Figure 1: An illustration of vocabulary trimming to Korean and French. </em>
</p>


***Vocabulary Trimming (VT)*** is a model compression technique, which reduces a multilingual LM vocabulary to a 
target language by deleting irrelevant tokens from its vocabulary (see Figure 1).
The motivation behind VT is that a multilingual LM has a huge vocabulary to cover all languages, that results in a large model size (see Figure 2). 
However, we don't need the bulk of those vocabularies, when we fine-tune the multilingual LM on a monolingual task in practice. Hence, 
we can delete such un-used vocabularies to reduce the model size.

<p align="center">
  <img src="https://raw.githubusercontent.com/asahi417/lm-vocab-trimming/master/assets/pie.png" width="400">
  <br><em> Figure 2: The ratio of the embedding matrix to the number of entire model parameters for each of multilingual LMs and the embedding matrix after VT with top-60 vocabulary. </em>
</p>

In theory, VT can compress any existing multilingual LM to build monolingual LMs in any language covered by the multilingual LM. 
In our experiments, we show that VT can retain the original performance of the multilingual LM, while being smaller in size
(in general around 50% of the original vocabulary size is enough) than the original multilingual LM. 
The evaluation is performed over four NLP tasks (two generative and two classification tasks) among four widely used multilingual
LMs in seven languages. Finally, we show that this methodology can keep the best of both monolingual and multilingual 
worlds by keeping a small size as monolingual models without the need for specifically retraining them, and even 
limiting potentially harmful social biases. Please check those experimental results as wel as the technical detail in our paper,
["TBA"](tba).


## Get Started 



<p align="center">
  <img src="https://raw.githubusercontent.com/asahi417/lm-vocab-trimming/master/assets/pie.png" width="400">
  <br><em> Figure 2: The ratio of the embedding matrix to the number of entire model parameters for each of multilingual LMs and the embedding matrix after VT with top-60 vocabulary. </em>
</p>

