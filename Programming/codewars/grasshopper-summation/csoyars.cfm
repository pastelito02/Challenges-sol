component {
    numeric function summation(required numeric n) {
        var sum = 0;
        for(var i=0; i<=n;i++){

            sum += i;
        }

        return sum;
    }
}
