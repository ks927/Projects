#[0, 1, 1, 2, 3, 5, 8...]

def fibs(n)
    arr = [0, 1]
    if n == 2
        arr
    elsif n == 1
        arr=[0]
    else
    2.upto(n) { arr << arr[-1] + arr[-2] }
        arr[0..n-1]
    end
end


def fibs_rec(n, arr=[0, 1])
    return arr if n == 2
    return arr=[0] if n == 1
    arr << arr[-1] + arr[-2]
    fibs_rec(n-1, arr)
end