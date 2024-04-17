; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %8

4:                                                ; preds = %1
  %5 = add nsw i32 %0, -1
  %6 = call i32 @recursive_factorial(i32 noundef %5)
  %7 = mul nsw i32 %6, %0
  br label %8

8:                                                ; preds = %4, %3
  %.0 = phi i32 [ 1, %3 ], [ %7, %4 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %4, %1
  %.01 = phi i32 [ 1, %1 ], [ %5, %4 ]
  %.0 = phi i32 [ 1, %1 ], [ %6, %4 ]
  %.not = icmp sgt i32 %.0, %0
  br i1 %.not, label %7, label %3

3:                                                ; preds = %2
  br label %4

4:                                                ; preds = %3
  %5 = mul nsw i32 %.0, %.01
  %6 = add nuw nsw i32 %.0, 1
  br label %2, !llvm.loop !6

7:                                                ; preds = %2
  ret i32 %.01
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %18, %2
  %.02 = phi i32 [ 0, %2 ], [ %.1, %18 ]
  %.01 = phi i32 [ 0, %2 ], [ %19, %18 ]
  %4 = icmp slt i32 %.01, %0
  br i1 %4, label %5, label %20

5:                                                ; preds = %3
  %6 = add nsw i32 %.01, %.02
  br label %7

7:                                                ; preds = %12, %5
  %.1 = phi i32 [ %6, %5 ], [ %15, %12 ]
  %.0 = phi i32 [ 0, %5 ], [ %16, %12 ]
  %8 = icmp slt i32 %.0, %1
  br i1 %8, label %9, label %17

9:                                                ; preds = %7
  %10 = call i32 @recursive_factorial(i32 noundef %.01)
  %11 = call i32 @normal_factorial(i32 noundef %.0)
  br label %12

12:                                               ; preds = %9
  %.0.neg = sub i32 0, %.0
  %.neg = sub i32 0, %11
  %13 = add i32 %.0.neg, %.1
  %14 = add i32 %13, %10
  %15 = add i32 %14, %.neg
  %16 = add nuw nsw i32 %.0, 1
  br label %7, !llvm.loop !8

17:                                               ; preds = %7
  br label %18

18:                                               ; preds = %17
  %19 = add nuw nsw i32 %.01, 1
  br label %3, !llvm.loop !9

20:                                               ; preds = %3
  ret i32 %.02
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2
  br label %4

4:                                                ; preds = %3
  %5 = call i32 @doing_something(i32 noundef 1, i32 noundef 2)
  %6 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1, i32 noundef 2, i32 noundef %5) #3
  br label %7

7:                                                ; preds = %4
  br label %8

8:                                                ; preds = %7
  %9 = call i32 @doing_something(i32 noundef 6, i32 noundef 3)
  %10 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 6, i32 noundef 3, i32 noundef %9) #3
  br label %11

11:                                               ; preds = %8
  br label %12

12:                                               ; preds = %11
  %13 = call i32 @doing_something(i32 noundef 2, i32 noundef 4)
  %14 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 2, i32 noundef 4, i32 noundef %13) #3
  br label %15

15:                                               ; preds = %12
  br label %16

16:                                               ; preds = %15
  %17 = call i32 @doing_something(i32 noundef 9, i32 noundef 5)
  %18 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 9, i32 noundef 5, i32 noundef %17) #3
  br label %19

19:                                               ; preds = %16
  br label %20

20:                                               ; preds = %19
  %21 = call i32 @doing_something(i32 noundef 10, i32 noundef 6)
  %22 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 10, i32 noundef 6, i32 noundef %21) #3
  br label %23

23:                                               ; preds = %20
  br i1 false, label %24, label %26

24:                                               ; preds = %23
  br label %25

25:                                               ; preds = %24
  unreachable

26:                                               ; preds = %23
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
