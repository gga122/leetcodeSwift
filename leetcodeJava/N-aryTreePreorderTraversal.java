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

    public List<Integer> postorder(Node root) {
        if (root != null) {
            if (root.children != null) {
                for (Node child : root.children) {
                    postorder(child);
                }
            }
            result.add(root.val);
        }
        return result;
    }

    public List<List<Integer>> levelOrder(Node root) {
        if (root == null) {
            List list = new ArrayList<Integer>();
            return list;
        }

        List<List<Integer>> levels = new ArrayList();
        List<Node> level = new ArrayList<Node>();
        level.add(root);
        do {
            List<Integer> valLevel = new ArrayList<Integer>();
            for (Node n : level) {
                valLevel.add(n.val);
            }
            if (valLevel.size() > 0) {
                levels.add(valLevel);
            }

            level = getChildNodes(level);
        } while (level != null);

        return levels;
    }

    public List<Node> getChildNodes(List<Node> nodes) {
        if (nodes == null || nodes.size() == 0) {
            return null;
        }

        List<Node> childs = new ArrayList<Node>();
        for (Node n : nodes) {
            childs.addAll(n.children);
        }

        return childs;
    }

    public int maxDepth(Node root) {
        if (root == null) {
            return 0;
        }

        int max = 0;
        for (Node n : root.children) {
            int maxDepth = maxDepth(n);
            max = Math.max(maxDepth, max);
        }

        return max + 1;
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

        System.out.println(maxDepth(n0));
    }

    public static void main(String[] args) {
        N_aryTreePreorderTraversalSolution solution = new N_aryTreePreorderTraversalSolution();
        solution.test();
    }
}