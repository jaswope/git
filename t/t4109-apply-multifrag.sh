# setup

cat > patch1.patch <<\EOF
diff --git a/main.c b/main.c
new file mode 100644
--- /dev/null
+++ b/main.c
@@ -0,0 +1,23 @@
+#include <stdio.h>
+
+int func(int num);
+void print_int(int num);
+
+int main() {
+	int i;
+
+	for (i = 0; i < 10; i++) {
+		print_int(func(i));
+	}
+
+	return 0;
+}
+
+int func(int num) {
+	return num * num;
+}
+
+void print_int(int num) {
+	printf("%d", num);
+}
+
EOF
cat > patch2.patch <<\EOF
diff --git a/main.c b/main.c
--- a/main.c
+++ b/main.c
@@ -1,7 +1,9 @@
+#include <stdlib.h>
 #include <stdio.h>
 
 int func(int num);
 void print_int(int num);
+void print_ln();
 
 int main() {
 	int i;
@@ -10,6 +12,8 @@
 		print_int(func(i));
 	}
 
+	print_ln();
+
 	return 0;
 }
 
@@ -21,3 +25,7 @@
 	printf("%d", num);
 }
 
+void print_ln() {
+	printf("\n");
+}
+
EOF
cat > patch3.patch <<\EOF
diff --git a/main.c b/main.c
--- a/main.c
+++ b/main.c
@@ -1,9 +1,7 @@
-#include <stdlib.h>
 #include <stdio.h>
 
 int func(int num);
 void print_int(int num);
-void print_ln();
 
 int main() {
 	int i;
@@ -12,8 +10,6 @@
 		print_int(func(i));
 	}
 
-	print_ln();
-
 	return 0;
 }
 
@@ -25,7 +21,3 @@
 	printf("%d", num);
 }
 
-void print_ln() {
-	printf("\n");
-}
-
EOF
cat > patch4.patch <<\EOF
diff --git a/main.c b/main.c
--- a/main.c
+++ b/main.c
@@ -1,13 +1,14 @@
 #include <stdio.h>
 
 int func(int num);
-void print_int(int num);
+int func2(int num);
 
 int main() {
 	int i;
 
 	for (i = 0; i < 10; i++) {
-		print_int(func(i));
+		printf("%d", func(i));
+		printf("%d", func3(i));
 	}
 
 	return 0;
@@ -17,7 +18,7 @@
 	return num * num;
 }
 
-void print_int(int num) {
-	printf("%d", num);
+int func2(int num) {
+	return num * num * num;
 }
 
EOF