


513. Find Bottom Left Tree Value
Given a binary tree, find the leftmost value in the last row of the tree.

Example 1:
Input:

    2
   / \
  1   3

Output:
1
Example 2: 
Input:

        1
       / \
      2   3
     /   / \
    4   5   6
       /
      7

Output:
7
Note: You may assume the tree (i.e., the given root node) is not NULL.


/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    int findBottomLeftValue(TreeNode* root) {
        queue<TreeNode *> q;
        
        q.push(root); 
        q.push(nullptr);
        
        bool levelStart = true;
        int left=-1;
        while (!q.empty()) {
            TreeNode *node = q.front();
            q.pop();
            
            if (node != nullptr) {
                if (levelStart) {
                    left = node->val;
                    levelStart=false;
                }
                if (node->left) q.push(node->left);
                if (node->right) q.push(node->right);
            } else if (!q.empty()) {
                q.push(nullptr);
                levelStart=true;    
            }
        }
        return left;
    }
};


// copied from discussion, recursive
class Solution {
public:
    int findBottomLeftValue(TreeNode* root) {
        int left=0,max=0;
        find(root,1,max,left);
        return left;
    }
    
    void find(TreeNode *root, int h, int &max, int &left){
        if(!root) return;
        find(root->left, h+1, max, left);
        if(h > max){
            max = h;
            left = root->val;
        }
        find(root->right, h+1, max, left);
    }
};
