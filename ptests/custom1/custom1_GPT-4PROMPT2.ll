; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %8

4:                                                ; preds = %1
  %5 = sub nsw i32 %0, 1
  %6 = call i32 @recursive_factorial(i32 noundef %5)
  %7 = mul nsw i32 %0, %6
  br label %8

8:                                                ; preds = %4, %3
  %.0 = phi i32 [ 1, %3 ], [ %7, %4 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %6, %1
  %.01 = phi i32 [ 1, %1 ], [ %5, %6 ]
  %.0 = phi i32 [ 1, %1 ], [ %7, %6 ]
  %3 = icmp sle i32 %.0, %0
  br i1 %3, label %4, label %8

4:                                                ; preds = %2
  %5 = mul nsw i32 %.01, %.0
  br label %6

6:                                                ; preds = %4
  %7 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

8:                                                ; preds = %2
  %.01.lcssa = phi i32 [ %.01, %2 ]
  ret i32 %.01.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %18, %2
  %.02 = phi i32 [ 0, %2 ], [ %.1.lcssa, %18 ]
  %.01 = phi i32 [ 0, %2 ], [ %19, %18 ]
  %4 = icmp slt i32 %.01, %0
  br i1 %4, label %5, label %20

5:                                                ; preds = %3
  %6 = add nsw i32 %.02, %.01
  br label %7

7:                                                ; preds = %15, %5
  %.1 = phi i32 [ %6, %5 ], [ %14, %15 ]
  %.0 = phi i32 [ 0, %5 ], [ %16, %15 ]
  %8 = icmp slt i32 %.0, %1
  br i1 %8, label %9, label %17

9:                                                ; preds = %7
  %10 = sub nsw i32 %.1, %.0
  %11 = call i32 @recursive_factorial(i32 noundef %.01)
  %12 = call i32 @normal_factorial(i32 noundef %.0)
  %13 = sub nsw i32 %11, %12
  %14 = add nsw i32 %10, %13
  br label %15

15:                                               ; preds = %9
  %16 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !8

17:                                               ; preds = %7
  %.1.lcssa = phi i32 [ %.1, %7 ]
  br label %18

18:                                               ; preds = %17
  %19 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !9

20:                                               ; preds = %3
  %.02.lcssa = phi i32 [ %.02, %3 ]
  ret i32 %.02.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [5 x i32], align 16
  %4 = alloca [5 x i32], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.as, i64 20, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 @__const.main.bs, i64 20, i1 false)
  br label %5

5:                                                ; preds = %2
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %4, align 4
  %11 = call i32 @doing_something(i32 noundef %9, i32 noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %7, i32 noundef %8, i32 noundef %11)
  br label %13

13:                                               ; preds = %6
  br label %14

14:                                               ; preds = %13
  %15 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 1
  %16 = load i32, ptr %15, align 4
  %17 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 1
  %18 = load i32, ptr %17, align 4
  %19 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 1
  %20 = load i32, ptr %19, align 4
  %21 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 1
  %22 = load i32, ptr %21, align 4
  %23 = call i32 @doing_something(i32 noundef %20, i32 noundef %22)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %16, i32 noundef %18, i32 noundef %23)
  br label %25

25:                                               ; preds = %14
  br label %26

26:                                               ; preds = %25
  %27 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %28 = load i32, ptr %27, align 4
  %29 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 2
  %30 = load i32, ptr %29, align 4
  %31 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %32 = load i32, ptr %31, align 4
  %33 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 2
  %34 = load i32, ptr %33, align 4
  %35 = call i32 @doing_something(i32 noundef %32, i32 noundef %34)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %28, i32 noundef %30, i32 noundef %35)
  br label %37

37:                                               ; preds = %26
  br label %38

38:                                               ; preds = %37
  %39 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %40 = load i32, ptr %39, align 4
  %41 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 3
  %42 = load i32, ptr %41, align 4
  %43 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %44 = load i32, ptr %43, align 4
  %45 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 3
  %46 = load i32, ptr %45, align 4
  %47 = call i32 @doing_something(i32 noundef %44, i32 noundef %46)
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %40, i32 noundef %42, i32 noundef %47)
  br label %49

49:                                               ; preds = %38
  br label %50

50:                                               ; preds = %49
  %51 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 4
  %52 = load i32, ptr %51, align 4
  %53 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 4
  %54 = load i32, ptr %53, align 4
  %55 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 4
  %56 = load i32, ptr %55, align 4
  %57 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 4
  %58 = load i32, ptr %57, align 4
  %59 = call i32 @doing_something(i32 noundef %56, i32 noundef %58)
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %52, i32 noundef %54, i32 noundef %59)
  br label %61

61:                                               ; preds = %50
  br i1 false, label %62, label %74

62:                                               ; preds = %61
  %63 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 5
  %64 = load i32, ptr %63, align 4
  %65 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 5
  %66 = load i32, ptr %65, align 4
  %67 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 5
  %68 = load i32, ptr %67, align 4
  %69 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 5
  %70 = load i32, ptr %69, align 4
  %71 = call i32 @doing_something(i32 noundef %68, i32 noundef %70)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %64, i32 noundef %66, i32 noundef %71)
  br label %73

73:                                               ; preds = %62
  unreachable

74:                                               ; preds = %61
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
