'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
XX--XX-
-XXX-XX
XX----X
-XXX---
X-----X
]]>.Value()

    ' Load grid to array    
    dim grid1(14, 20) as string ' make the array bigger than needed
    dim grid2(14, 20) as string ' make the array bigger than needed
    ClearGrid(grid1)
    
    dim gx = 7, gy = 5 ' load in the center of the array
    
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim cells = line.ToCharArray
        for each c in cells
            grid1(gy, gx) = c
            gx += 1
        next
        gy += 1 : gx = 7
    next    

    ' Run 5 generations
    dim ans = ""
    for g = 1 to 5
        ' Simplification: we won't run the edges of the array; simplifies the code.
        ' Array is big enough that "life" won't reach the edges in 5 turns.

        ClearGrid(grid2) ' assume everyone dies
        
        for y = 1 to grid1.GetLength(0)-2
            for x = 1 to grid1.GetLength(1)-2
                ' Apply the rules to grid1, store results in grid2
                if grid1(y,x) = "X" then
                    ' Cell present, count the neighbors
                    dim nb = CountNeighbors(grid1, y, x)                    
                    if (nb = 2) or (nb = 3) then grid2(y,x) = "X" ' Cell will live on
                else
                    ' Empty - count the neighbors
                    dim nb = CountNeighbors(grid1, y, x)
                    if (nb = 3) then grid2(y,x) = "X" ' Cell is born
                end if
            next
        next
        
        CopyGrid(grid2, grid1)

        ans &= CountCells(grid1) & " "

    next
    ans.dump

End Sub

function CountNeighbors(byref grid(,) as string, y as integer, x as integer) as integer
    dim count = 0
    for i = -1 to 1
        for j = -1 to 1
            if not (i=0 and j=0) then ' don't count the cell itself
                if grid(y+i, x+j) = "X" then count+=1
            end if
        next
    next
    return count
end function

function CountCells(byref grid(,) as string) as integer
    dim count = 0
    for y = 0 to grid.GetLength(0)-1
        for x = 0 to grid.GetLength(1)-1
            if grid(y,x) = "X" then count += 1
        next
    next
    return count
end function

sub CopyGrid(src(,) as string, byref dest(,) as string)
    for y = 0 to src.GetLength(0)-1
        for x = 0 to src.GetLength(1)-1
            dest(y, x) = src(y, x)
        next
    next
end sub

sub ClearGrid(byref grid(,) as string)
    for y = 0 to grid.GetLength(0)-1
        for x = 0 to grid.GetLength(1)-1
            grid(y, x) = "-"
        next
    next
end sub
