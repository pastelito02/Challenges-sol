//Author asteriskman
const [w, h] = input().split` `.map( v => v|0 );

const grid = [];
for (let i = 0; i < h; i++) {
    grid.push(input().split``.map( v => v|0));
}

function walkMaze(x, y, visited, dir) {
    if (x === 0 && y === 0) {return dir;}
    if (visited === undefined) {visited = {};}
    if (visited[`${x} ${y}`]) {
        return '';
    }
    visited[`${x} ${y}`] = 1;
    if (y >= h || y < 0 || x >= w || x < 0) {
        return '';
    }
    if (grid[y][x] !== 1) {
        return '';
    }
    if (dir === undefined) {dir = '';}
    const stepsL = walkMaze(x-1,y,visited, 'L');
    const stepsR = walkMaze(x+1,y,visited, 'R');
    const stepsU = walkMaze(x,y-1,visited, 'U');
    const stepsD = walkMaze(x,y+1,visited, 'D');
    const subSteps = stepsL+stepsR+stepsU+stepsD;
    return subSteps.length === 0 ? '' : dir+subSteps;
}

function rle(dirList) {
    let result = '';
    let curChar = '';
    let curCount = 0;
    for (let i = 0; i < dirList.length; i++) {
        if (dirList[i] === curChar) {
            curCount++;
        } else {
            if (curChar !== '') {
                result += curCount + curChar;
                curCount = 1;
                curChar = dirList[i];
            } else {
                curChar = dirList[i];
                curCount = 1;
            }
        }
    }
    result += curCount + curChar;
    return result;
}

const solutionA = rle(walkMaze(w-1, 0));
const solutionB = rle(walkMaze(0, h-1));
const solutionC = rle(walkMaze(w-1, h-1));

output(`${solutionA} ${solutionB} ${solutionC}`);