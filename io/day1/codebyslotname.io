#!/usr/local/bin/io

MyObject := Object clone do(
  someslot := method(writeln("called someslot of MyObject!"))
)

MyObject getSlot("someslot") call
