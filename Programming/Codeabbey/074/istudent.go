//Author istudent
import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

func clockHands() {
	var numOfInputs int
	fmt.Scanf("%d\n", &numOfInputs)
	for i := 0; i < numOfInputs; i++ {
		var time string
		hLen := 6.0
		mLen := 9.0
		fmt.Scanf("%s", &time)
		colon := strings.Index(time, ":")
		hours, _ := strconv.ParseFloat(time[:colon], 64)
		minutes, _ := strconv.ParseFloat(time[colon+1:], 64)
		hourAngle := -1*(30*(hours-3)) - (minutes / 60 * 30)
		minuteAngle := -6 * (minutes - 15)
		minuteAngle = minuteAngle / 360 * 2 * math.Pi
		hourAngle = hourAngle / 360 * 2 * math.Pi
		fmt.Print(hLen*math.Cos(hourAngle)+10.0, hLen*math.Sin(hourAngle)+10.0, mLen*math.Cos(minuteAngle)+10.0, mLen*math.Sin(minuteAngle)+10.0, " ")
	}
}
