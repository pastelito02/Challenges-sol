//Author phamhm
package com.hupham.MazePathfinder;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Created by hp on 4/1/17.
 */
public class Maze {
    final private List<char[]> maze = new ArrayList<>();
    private int rows, cols;
    private Point A, B, C;
    final private Map<Point, String> res = new ConcurrentHashMap<>();


    public Maze(String fileName) {
        String dir = System.getProperty("user.dir");

        try (Stream<String> fileStream = Files.lines(Paths.get(dir + "/" + fileName))){

            fileStream.skip(1) // first line store size.
                      .map(String::toCharArray)
                      .forEach(maze::add);

            this.rows = maze.size();
            this.cols = maze.get(0).length;

            A = new Point(0, cols-1);
            B = new Point(rows-1,0);
            C = new Point(rows-1, cols-1);

            List<Point> pts = Arrays.asList(A, B, C);


            for (Point pt : pts){
                Thread t = new Thread(new MazeSolver(maze, pt, res));
                t.start();
                t.join();
            }

            System.out.println(pts.stream()
                                  .map(pt -> res.get(pt))
                                  .collect(Collectors.joining(" ")));



        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        new Maze("data.txt");
    }
}

class MazeSolver implements Runnable {
    private final List<char[]> maze;
    private final Point startPoint;
    private Point Goal = new Point(0, 0);
    private int rows, cols;
    private Stack<Moves> dir = new Stack<>();
    private List<Point> visited = new ArrayList<>();
    final private Map<Point, String> res;

    // Up, Left, Right, Down+Left
    public enum Moves{U, L, R, D};

    public Stack<Moves> getDir() {
        return dir;
    }

    private Point toLeft(Point p) {
        return new Point(p.row, p.col-1);
    }

    private Point toRight(Point p){
        return new Point( p.row, p.col +1);
    }

    private Point toUp(Point p){
        return new Point(p.row -1, p.col);
    }

    private Point toDown(Point p){
        return new Point(p.row+1, p.col);
    }

    private boolean inBoundary(Point p) {
        return p.row >= 0 && p.row < this.rows &&
                p.col >= 0 && p.col < this.cols;
    }

    private boolean move(Point p) {

        if (p.equals(Goal))
            return true;

        if (!inBoundary(p))
            return false;

        char[] row = maze.get(p.row);
        if (row[p.col] != '1')
            return false;

        if (visited.contains(p))
            return false;
        else
            visited.add(p);

        if (move(toRight(p))){
            dir.add(Moves.R);
            return true;
        }
        else if (move(toLeft(p))){
            dir.add(Moves.L);
            return true;
        }
        else if (move(toUp(p))){
            dir.add(Moves.U);
            return true;
        }
        else if (move(toDown(p))){
            dir.add(Moves.D);
            return true;
        }

        return false;
    }

    public MazeSolver(List<char[]> maze, Point startPoint, Map<Point, String> res) {
        this.maze = maze;
        this.startPoint = startPoint;
        this.rows = maze.size();
        this.cols = maze.get(0).length;
        this.res = res;
    }

    @Override
    public void run() {
        move(startPoint);
//        Collections.reverse(dir);

        Moves prev = null;
        String res = "";
        int count = 0;

        while(!dir.empty()) {
            Moves cur = dir.pop();
            if (prev == null){
                prev = cur;
                count = 1;
            }
            else if (cur == prev)
                ++count;
            else {
                res = res + count +prev;
                prev = cur;
                count = 1;
            }

        }
        res = res + count +prev;

        this.res.put(startPoint, res);
    }
}

class Point {
    public int row, col;

    Point(int row, int col) {
        this.row = row;
        this.col = col;
    }

    @Override
    public String toString() {
        return "Point{" +
                "row=" + row +
                ", col=" + col +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Point point = (Point) o;

        if (row != point.row) return false;
        return col == point.col;
    }

    @Override
    public int hashCode() {
        int result = row;
        result = 31 * result + col;
        return result;
    }
}
