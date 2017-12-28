---
layout: post
title:  "RubySpec is Reborn!"
---

### TL;DR
The Ruby Spec Suite is actively maintained at [ruby/spec][rubyspec] and
[MRI][rubyci], [JRuby][jruby], [Opal][opal] and various individuals are contributing to it.
Any contribution is welcome!

### Once Upon a 31<sup>st</sup> December ...

[@brixen][brixen], the main contributor to RubySpec, decided to [end the project][end-blog-post].
While no longer maintaining the project is understandable,
ending it entirely might be a bit presumptuous.

A few days later, [@headius][headius] started a discussion on [ruby-core][future-of-test-suites]
about the *"Future of test suites for Ruby"*.
Participants quickly agreed that both RubySpec and the MRI test suite are valuable, have their own strengths and are complementary.
After a couple exchanges with contributors from different Ruby implementations, I announced my intention to revive RubySpec as a collaborative effort.

### Bringing RubySpec up to Date

MRI has been running RubySpec since its 1.9.2 release.
But at some point RubySpec was forked because of some disagreements.
That fork has been maintained by MRI committers to pass on all supported MRI versions but was never merged upstream.

The first step was therefore to merge rubyspec/rubyspec with the MRI fork.

[@anthonycrumley][anthonycrumley] started to fix many specs which were incompatible with MRI.
[@nurse][nurse] and [@hsbt][hsbt] proposed to have the new repository at [ruby/spec][rubyspec].
And finally [@eregon][eregon] made the actual merge (of 1426 commits!)
and fixed the specs to run on all supported versions of MRI (2.0.0 -- trunk).

The result is we now have a version of RubySpec with all major forks integrated,
fully compatible with the reference implementation and run by many others.

### Collaborating with Other Implementations

The goal of RubySpec is to define an accurate and runnable specification of the Ruby language.
This is a challenging task and really makes sense only if many implementations use it.

JRuby has been using RubySpec for many years but needed a more efficient way to contribute back than a separate repository. The technical issues were solved and commits are now synchronized regularly in both directions.
[TruffleRuby][jrubytruffle], a new high-performance implementation of Ruby, is also extensively using RubySpec.

Opal started using RubySpec and now passes thousands of specs examples.
[@vais][vais] and [@elia][elia] have recently switched to ruby/spec
and already contributed many commits.
Opal is a particularly interesting implementation for RubySpec
in that it tries to find the balance between mapping Ruby concepts to JavaScript and being more compatible.

We [asked][future-of-rubyspec] Rubinius if they wanted to contribute to a common set of Ruby specs
and they replied they were no more interested in that, although some
sharing might be possible while they use RubySpec-like specs (it's open source after all!).

### Contributing

Any contribution to RubySpec is a contribution to better specify Ruby
and to guarantee consistent behavior across various implementations.

There is only one rule to contribute: respecting the existing style of specs.
We want to maintain a good standard for specs and for that
we just ask to use pull requests for new contributions.

The question is then, how to contribute?

There are many ways, but the most common are:

* Improve existing specs: clarify behavior, make them less implementation-dependent, etc
* Write specs for currently unspecified methods (there is a [tool][CONTRIBUTING.md] for it!)
* Write specs for new Ruby features

If you are not sure what to work on, just [open an issue][issues] and ask!

{% highlight ruby %}
describe "RubySpec.new" do
  it "is a path to more compatible rubies" do
    contribute.and(the_future.of(Ruby)).should == :bright
  end
end
{% endhighlight %}

[rubyspec]: https://github.com/ruby/spec
[brixen]: https://github.com/brixen
[end-blog-post]: http://rubini.us/2014/12/31/matz-s-ruby-developers-don-t-use-rubyspec/
[eregon]: https://github.com/eregon
[anthonycrumley]: https://github.com/anthonycrumley
[nurse]: https://github.com/nurse
[hsbt]: https://github.com/hsbt
[vais]: https://github.com/vais
[elia]: https://github.com/elia
[headius]: https://github.com/headius
[rubyci]: http://rubyci.org/
[jruby]: http://jruby.org/
[jrubytruffle]: https://github.com/graalvm/truffleruby
[opal]: http://opalrb.org/
[future-of-test-suites]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/67346
[future-of-rubyspec]: https://github.com/rubinius/rubinius/issues/3403
[CONTRIBUTING.md]: https://github.com/ruby/spec/blob/master/CONTRIBUTING.md
[issues]: https://github.com/ruby/spec/issues
