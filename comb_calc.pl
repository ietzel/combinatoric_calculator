import math
from tkinter import *

def permutation(n, k) {
  return (math.factorial(n)/math.factorial(n-k)) 
}

def combinatoric(n, k) {
  return permutation(n, k)/math.factorial(k)))  
}

def stirling_second_kind(n, k) {
  sum = 0;
  for x in range(0, k):
    sum += (((-1)^(k-x))*combinatoric(n, x)*(x^n))
  return math.factorial(k)*sum
}

def permutation_sum(n, k) {
  sum = 0;
  for x in range(1, k):
    sum += permutation(n, x)
  return sum
}

def stirling_second_kind_sum(n, k) {
  sum = 0;
  for x in range(1, k):
    sum += stirling_second_kind(n, k)
  return sum
}

def balls_and_boxes_problem(balls, boxes, dist_bls, dist_bxs, empty_allowed) {
  if(dist_bls) {
    return stirling_second_kind(n, k)
  } else if(dist_bxs) {
    return combinatoric(n-1, k-1)
  } else if(empty_allowed) {
    return permutation_sum(balls, boxes)
  } else if(dist_bls and dist_bxs) {
    return math.factorial(balls)*stirling_second_kind(n, k)
  } else if(dist_bls and empty_allowed) {
    return stirling_second_kind_sum(n, k)
  } else if(dist_bxs and empty_allowed) {
    return combinatoric(balls+boxes-1, k)
  } else if(dist_bls and dist_bxs and empty_allowed) {
    return boxes^balls
  } else {
    permutation(balls, boxes)
  }
}

root = Tk()
w = Label(root, text='Combinatoric Calculator')
w.pack()
inputtext = tk.Text(root, height = 4, width = 8) 
inputtext.pack() 
root.mainloop()

def main():
  items = input("Number of items? ")
  items = int(items)
  containers = input("Number of containers? ")
  containers = int(containers)
  dist_its = input("Distinguishable items? ")
  dist_its = boolean(dist_its)
  dist_cts = input("Distinguishable containers? ")
  dist_cts = boolean(dist_cts)
  empty_allowed = input("Empty allowed? ")
  empty_allowed = boolean(empty_allowed)
  print("Possible arrangements: " + balls_and_boxes_problem(items, containers, dist_its, dist_cts, empty_allowed) 
