import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.SortedSet;
import java.util.TreeSet;

public class TestPage {
	public static void main(String[] args) {
		int[]nums = {1,1,1,5,4,6,1,3,2,2,2,2,2,3,4,5,6,7,8};
		
		int maxMonster = nums.length/2;
		TreeSet<Integer> ts = new TreeSet<Integer>();
		for(int i=0; i<nums.length;i++) {
			ts.add(nums[i]);
			
		}		
		System.out.println(ts.toString());
		
		for(int i=0; i<ts.size();i++) {
		System.out.println(ts.);
		}
		
		if(maxMonster<ts.size()) {
			//maxMonster가 더 적으면
			System.out.println(maxMonster);
		} else {
			System.out.println(ts.size());
		}
	}
}
