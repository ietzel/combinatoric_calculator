import math

def permutation(n, k) {
  return (math.factorial(n)/math.factorial(n-k)) 
}

def combinatoric(n, k) {
  return permutation(n, k)/math.factorial(k)))  
}

def permutation_sum(n, k) {
  sum = 0;
  for x in range(1, k):
    sum += permutation(n, x)
  return sum
}

def balls_and_boxes_problem(balls, boxes, dist_bls, dist_bxs, empty_allowed) {
  if(dist_bls) {
    return
  } else if(dist_bxs) {
    return combinatoric(n-1, k-1)
  } else if(empty_allowed) {
    return permutation_sum(balls, boxes)
  } else if(dist_bls and dist_bxs) {
    return
  } else if(dist_bls and empty_allowed) {
    return
  } else if(dist_bxs and empty_allowed) {
    return combinatoric(n+k-1, k)
  } else if(dist_bls and dist_bxs and empty_allowed) {
    return boxes^balls
  } else {
    permutation(balls, boxes)
  }
}

def main():
  items = input("Number of items? ")
  containers = input("Number of containers? ")
