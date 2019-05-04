import java.util.*;

class N_aryTreePreorderTraversalSolution {

    class Node {
        public int val;
        public List<Node> children;

        public Node() {
        }

        public Node(int _val, List<Node> _children) {
            val = _val;
            children = _children;
        }
    };

    List<Integer> result = new ArrayList<>();

    public List<Integer> preorder(Node root) {
        if (root != null) {
            result.add(root.val);
            if (root.children != null) {
                for (Node child : root.children) {
                    preorder(child);
                }
            }
        }
        return result;
    }

    public void test() {
        Node n0 = new Node(1, new ArrayList<>());
        Node n1 = new Node(3, new ArrayList<>());
        n0.children.add(n1);
        Node n2 = new Node(2, new ArrayList<>());
        n0.children.add(n2);
        Node n3 = new Node(4, new ArrayList<>());
        n0.children.add(n3);
        Node n4 = new Node(5, new ArrayList<>());
        n1.children.add(n4);
        Node n5 = new Node(6, new ArrayList<>());
        n1.children.add(n5);

        System.out.println(preorder(n0));
    }

    public static void main(String[] args) {
        N_aryTreePreorderTraversalSolution solution = new N_aryTreePreorderTraversalSolution();
        solution.test();
    }
}