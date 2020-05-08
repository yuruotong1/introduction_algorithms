function insert_asc_sort()
{
  arr=("$@")
  len=${#arr[@]}
  for((j=1; j<$len;j++));do
    key=${arr[j]}
    i=`expr $j - 1`
    while [ $i -ge 0 ] && [ ${arr[i]} -gt $key ];do
      arr[i+1]=${arr[i]}
      i=`expr $i - 1`
    done
    arr[i+1]=$key
  done
  echo ${arr[@]}
}

#练习 2.1-2
function insert_des_sort()
{
  arr=("$@")
  len=${#arr[@]}
  for((j=1; j<$len;j++));do
    key=${arr[j]}
    i=`expr $j - 1`
    while [ $i -ge 0 ] && [ ${arr[i]} -lt $key ];do
      arr[i+1]=${arr[i]}
      i=`expr $i - 1`
    done
    arr[i+1]=$key
  done
  echo ${arr[@]}
}

#练习2.1-3

# 循环不变式： 每次 n 个值不变 
function find()
{
  declare -a arr=("${!1}")
  for((i=0;i<${#arr[@]};i++));do
    if [ ${arr[i]} -eq  $2 ];then
      echo "true"
      return 0
    fi
  done
  echo "false"
}

# arr1=(1 2 3 4)
# find arr1[@] 2

# 练习2.1-4
function two_binary()
{
  local A=("${!1}")
  local B=("${!2}")
  local flag=0
  local n=${#A[@]}
  for((j=0;j<$n;j++));do
    key=`expr ${A[j]} + ${B[j]} + $flag`
    C[j]=`expr $key % 2`
    if [ ${key} -gt 1 ];then
      flag=1
    fi
  done
  if [ $flag -eq 1 ];then
    C[n+1]=1
  fi
  echo ${C[@]}
}

# A1=(1 0 1 0)
# B1=(1 1 0 1)
# two_binary A1[@] B1[@]


# 练习 2.2-2
# 最好最坏复杂度都是 O(n^2)
function tmp2_2_2() {
  arr=("${!1}")
  n=${#arr[@]}
  # 注意是 n-1 不是 n
  for((j=0;j<`expr $n - 1`;j++));do
    min=${arr[j]}
    local min_loc=$j
    for((i=$j;i<$n;i++));do
      if [ $min -gt ${arr[i]} ];then
        min=${arr[i]}
        min_loc=$i
      fi
    done
    tmp=${arr[min_loc]}
    arr[min_loc]=${arr[j]}
    arr[j]=$tmp
  done
  echo ${arr[@]}

}

# arr=(1 4 3 7 5 2 10 0)
# tmp2_2_2 arr[@]