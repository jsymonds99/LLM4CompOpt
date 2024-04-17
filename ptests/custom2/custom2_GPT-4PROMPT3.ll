; ModuleID = 'custom2_unoptimized.ll'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %17, %3
  %.0 = phi double [ -1.000000e+09, %3 ], [ %.1, %17 ]
  %storemerge = phi i32 [ -10, %3 ], [ %18, %17 ]
  %5 = icmp slt i32 %storemerge, 11
  br i1 %5, label %6, label %19

6:                                                ; preds = %4
  %7 = sitofp i32 %storemerge to double
  %8 = fmul double %0, %7
  %9 = sitofp i32 %storemerge to double
  %10 = sitofp i32 %storemerge to double
  %11 = fmul double %1, %10
  %12 = call double @llvm.fmuladd.f64(double %8, double %9, double %11)
  %13 = fadd double %2, %12
  %14 = fcmp ogt double %13, %.0
  br i1 %14, label %15, label %16

15:                                               ; preds = %6
  br label %16

16:                                               ; preds = %15, %6
  %.1 = phi double [ %13, %15 ], [ %.0, %6 ]
  br label %17

17:                                               ; preds = %16
  %18 = add nsw i32 %storemerge, 1
  br label %4, !llvm.loop !6

19:                                               ; preds = %4
  ret double %.0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %17, %3
  %.0 = phi double [ 1.000000e+09, %3 ], [ %.1, %17 ]
  %storemerge = phi i32 [ -10, %3 ], [ %18, %17 ]
  %5 = icmp slt i32 %storemerge, 11
  br i1 %5, label %6, label %19

6:                                                ; preds = %4
  %7 = sitofp i32 %storemerge to double
  %8 = fmul double %0, %7
  %9 = sitofp i32 %storemerge to double
  %10 = sitofp i32 %storemerge to double
  %11 = fmul double %1, %10
  %12 = call double @llvm.fmuladd.f64(double %8, double %9, double %11)
  %13 = fadd double %2, %12
  %14 = fcmp olt double %13, %.0
  br i1 %14, label %15, label %16

15:                                               ; preds = %6
  br label %16

16:                                               ; preds = %15, %6
  %.1 = phi double [ %13, %15 ], [ %.0, %6 ]
  br label %17

17:                                               ; preds = %16
  %18 = add nsw i32 %storemerge, 1
  br label %4, !llvm.loop !8

19:                                               ; preds = %4
  ret double %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #2 {
  br label %1

1:                                                ; preds = %38, %0
  %.04 = phi i32 [ 10, %0 ], [ %.15, %38 ]
  %.0 = phi i32 [ 15, %0 ], [ %.2, %38 ]
  %storemerge = phi i32 [ 0, %0 ], [ %39, %38 ]
  %2 = icmp slt i32 %storemerge, %.0
  br i1 %2, label %3, label %40

3:                                                ; preds = %1
  %4 = and i32 %storemerge, 1
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %3
  %7 = add nsw i32 %.0, 2
  %8 = mul nsw i32 %.04, 3
  br label %12

9:                                                ; preds = %3
  %10 = add nsw i32 %.0, -1
  %11 = sdiv i32 %.04, 5
  br label %12

12:                                               ; preds = %9, %6
  %.1 = phi i32 [ %7, %6 ], [ %10, %9 ]
  %storemerge1 = phi i32 [ %11, %9 ], [ %8, %6 ]
  br label %13

13:                                               ; preds = %35, %12
  %.15 = phi i32 [ %storemerge1, %12 ], [ %storemerge3, %35 ]
  %.2 = phi i32 [ %.1, %12 ], [ %.3, %35 ]
  %storemerge2 = phi i32 [ 0, %12 ], [ %36, %35 ]
  %14 = icmp slt i32 %storemerge2, %.15
  br i1 %14, label %15, label %37

15:                                               ; preds = %13
  %16 = and i32 %storemerge2, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %15
  %19 = add nsw i32 %.2, 2
  %20 = mul nsw i32 %.15, 3
  br label %24

21:                                               ; preds = %15
  %22 = add nsw i32 %.2, -1
  %23 = sdiv i32 %.15, 5
  br label %24

24:                                               ; preds = %21, %18
  %.3 = phi i32 [ %19, %18 ], [ %22, %21 ]
  %storemerge3 = phi i32 [ %23, %21 ], [ %20, %18 ]
  %25 = sitofp i32 %storemerge2 to double
  %26 = sitofp i32 %.3 to double
  %27 = sitofp i32 %storemerge3 to double
  %28 = call double @find_max(double noundef %25, double noundef %26, double noundef %27)
  %29 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %28) #4
  %30 = sitofp i32 %storemerge2 to double
  %31 = sitofp i32 %.3 to double
  %32 = sitofp i32 %storemerge3 to double
  %33 = call double @find_min(double noundef %30, double noundef %31, double noundef %32)
  %34 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %33) #4
  br label %35

35:                                               ; preds = %24
  %36 = add nsw i32 %storemerge2, 1
  br label %13, !llvm.loop !9

37:                                               ; preds = %13
  br label %38

38:                                               ; preds = %37
  %39 = add nsw i32 %storemerge, 1
  br label %1, !llvm.loop !10

40:                                               ; preds = %1
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { nofree noinline nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
