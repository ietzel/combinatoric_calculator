integer function fact(n)
  integer, intent(in) :: n
  integer :: i
  if (n < 0) error stop 'factorial is singular for negative integers'
  fact = 1
  do i = 2, n
    fact = fact * i
  enddo
end function fact

subroutine permutation(n, k)   
   implicit none
   integer :: n, k
   RETURN (fact(n)/fact(n-k))
end subroutine permutation

subroutine combinatoric(n, k)
  implicit none
  integer :: n, k
  RETURN permutation(n, k)/fact(k)))  
end subroutine combinatoric

subroutine stirling_second_kind(n, k)
  implicit none
  integer :: n, k
  integer sum = 0;
  for x in range(0, k):
    sum += (((-1)^(k-x))*combinatoric(n, x)*(x^n))
  RETURN math.factorial(k)*sum
end subroutine stirling_second_kind

subroutine permutation_sum(n, k)
  implicit none
  integer :: n, k
  integer sum = 0;
  for x in range(1, k):
    sum += permutation(n, x)
  RETURN sum
end subroutine permutation_sum

subroutine stirling_second_kind_sum(n, k)
  implicit none
  integer :: n, k
  integer sum = 0;
  for x in range(1, k):
    sum += stirling_second_kind(n, k)
  RETURN sum
end subroutine stirling_second_kind_sum

subroutine balls_and_boxes_problem(balls, boxes, dist_bls, dist_bxs, empty_allowed)
  implicit none
  integer :: balls, boxes
  boolean :: dist_bls, dist_bxs, empty_allowed
  if(dist_bls) {
    RETURN stirling_second_kind(n, k)
  } else if(dist_bxs) {
    RETURN combinatoric(n-1, k-1)
  } else if(empty_allowed) {
    RETURN permutation_sum(balls, boxes)
  } else if(dist_bls and dist_bxs) {
    RETURN math.factorial(balls)*stirling_second_kind(n, k)
  } else if(dist_bls and empty_allowed) {
    RETURN stirling_second_kind_sum(n, k)
  } else if(dist_bxs and empty_allowed) {
    RETURN combinatoric(balls+boxes-1, k)
  } else if(dist_bls and dist_bxs and empty_allowed) {
    RETURN boxes^balls
  } else {
    permutation(balls, boxes)
  }
end subroutine balls_and_boxes_problem

subroutine main()
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
end subroutine main
