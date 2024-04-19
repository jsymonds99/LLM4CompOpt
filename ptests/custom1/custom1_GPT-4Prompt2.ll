; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %4, %1
  %accumulator.tr = phi i32 [ 1, %1 ], [ %6, %4 ]
  %.tr = phi i32 [ %0, %1 ], [ %5, %4 ]
  %2 = icmp eq i32 %.tr, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %tailrecurse
  br label %7

4:                                                ; preds = %tailrecurse
  %5 = sub nsw i32 %.tr, 1
  %6 = mul nsw i32 %.tr, %accumulator.tr
  br label %tailrecurse

7:                                                ; preds = %3
  %accumulator.ret.tr = mul nsw i32 1, %accumulator.tr
  ret i32 %accumulator.ret.tr
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %6, %1
  %3 = phi i32 [ %7, %6 ], [ 1, %1 ]
  %4 = phi i32 [ %8, %6 ], [ 1, %1 ]
  %5 = icmp sle i32 %4, %0
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = mul nsw i32 %3, %4
  %8 = add nsw i32 %4, 1
  br label %2, !llvm.loop !6

9:                                                ; preds = %2
  ret i32 %3
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %20, %2
  %4 = phi i32 [ %11, %20 ], [ 0, %2 ]
  %5 = phi i32 [ %21, %20 ], [ 0, %2 ]
  %6 = icmp slt i32 %5, %0
  br i1 %6, label %7, label %22

7:                                                ; preds = %3
  %8 = add nsw i32 %4, %5
  br label %9

9:                                                ; preds = %13, %7
  %10 = phi i32 [ %19, %13 ], [ 0, %7 ]
  %11 = phi i32 [ %18, %13 ], [ %8, %7 ]
  %12 = icmp slt i32 %10, %1
  br i1 %12, label %13, label %20

13:                                               ; preds = %9
  %14 = sub nsw i32 %11, %10
  %15 = tail call i32 @recursive_factorial(i32 noundef %5)
  %16 = tail call i32 @normal_factorial(i32 noundef %10)
  %17 = sub nsw i32 %15, %16
  %18 = add nsw i32 %14, %17
  %19 = add nsw i32 %10, 1
  br label %9, !llvm.loop !8

20:                                               ; preds = %9
  %21 = add nsw i32 %5, 1
  br label %3, !llvm.loop !9

22:                                               ; preds = %3
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [5 x i32], align 16
  %4 = alloca [5 x i32], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.as, i64 20, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 @__const.main.bs, i64 20, i1 false)
  br label %5

5:                                                ; preds = %8, %2
  %6 = phi i32 [ %16, %8 ], [ 0, %2 ]
  %7 = icmp slt i32 %6, 5
  br i1 %7, label %8, label %17

8:                                                ; preds = %5
  %9 = sext i32 %6 to i64
  %10 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 %9
  %13 = load i32, ptr %12, align 4
  %14 = tail call i32 @doing_something(i32 noundef %11, i32 noundef %13)
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11, i32 noundef %13, i32 noundef %14)
  %16 = add nsw i32 %6, 1
  br label %5, !llvm.loop !10

17:                                               ; preds = %5
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
!10 = distinct !{!10, !7}
