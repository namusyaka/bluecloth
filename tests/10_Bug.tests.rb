#!/usr/bin/ruby
#
# Unit test for bugs found in BlueCloth
# $Id$
#
# Copyright (c) 2004 The FaerieMUD Consortium.
# 

if !defined?( BlueCloth ) || !defined?( BlueCloth::TestCase )
	basedir = File::dirname( __FILE__ )
	require File::join( basedir, 'bctestcase' )
end


require 'timeout'

### This test case tests ...
class BugsTestCase < BlueCloth::TestCase
	BaseDir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )

	### Test to be sure the README file can be transformed.
	def test_00_slow_block_regex
		contents = File::read( File::join(BaseDir,"README") )
		bcobj = BlueCloth::new( contents )

		assert_nothing_raised {
			timeout( 2 ) do
				bcobj.to_html
			end
		}
	end

	### :TODO: Add more documents and test their transforms.

	def test_10_regexp_engine_overflow_bug
		return skip(
			"\n*** Known bug -- I need a way to prep the input so that it doesn't\n" +
			"*** overflow Ruby's matcher."
			)

		contents = File::read( File::join(BaseDir,"tests/data/re-overflow.txt") )
		bcobj = BlueCloth::new( contents )

		assert_nothing_raised {
			bcobj.to_html
		}
	end
	
end


__END__

