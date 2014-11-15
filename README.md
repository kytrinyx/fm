# FM

Sample code to demonstrate conditional to polymorphism refactoring.

## The Problem

You've got a command-line program that plays music. It has a `mixtape` mode,
but people are complaining that they want to be able to configure the genres
that they'll hear. Some people are extremely picky and want to whitelist
genres, others are mostly omnivorous, but want to avoid a small handful of
very specific genres.

So what's a programmer to do?
