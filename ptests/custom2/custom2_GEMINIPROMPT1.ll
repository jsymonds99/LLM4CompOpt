; ModuleID = 'custom2_unoptimized.ll'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %8, %3
  %5 = phi double [ %15, %8 ], [ -1.000000e+09, %3 ]
  %6 = phi i32 [ %16, %8 ], [ -10, %3 ]
  %7 = icmp slt i32 %6, 11
  br i1 %7, label %8, label %17

8:                                                ; preds = %4
  %9 = sitofp i32 %6 to double
  %10 = fmul double %9, %0
  %11 = fmul double %9, %1
  %12 = call double @llvm.fmuladd.f64(double %10, double %9, double %11)
  %13 = fadd double %12, %2
  %14 = fcmp ogt double %13, %5
  %15 = select i1 %14, double %13, double %5
  %16 = add nsw i32 %6, 1
  br label %4, !llvm.loop !6

17:                                               ; preds = %4
  ret double %5
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %8, %3
  %5 = phi double [ %15, %8 ], [ 1.000000e+09, %3 ]
  %6 = phi i32 [ %16, %8 ], [ -10, %3 ]
  %7 = icmp slt i32 %6, 11
  br i1 %7, label %8, label %17

8:                                                ; preds = %4
  %9 = sitofp i32 %6 to double
  %10 = fmul double %9, %0
  %11 = fmul double %9, %1
  %12 = call double @llvm.fmuladd.f64(double %10, double %9, double %11)
  %13 = fadd double %12, %2
  %14 = fcmp olt double %13, %5
  %15 = select i1 %14, double %13, double %5
  %16 = add nsw i32 %6, 1
  br label %4, !llvm.loop !8

17:                                               ; preds = %4
  ret double %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #2 {
  br label %1

1:                                                ; preds = %43, %0
  %2 = phi i32 [ %19, %43 ], [ 10, %0 ]
  %3 = phi i32 [ %21, %43 ], [ 15, %0 ]
  %4 = phi i32 [ %44, %43 ], [ 0, %0 ]
  %5 = icmp slt i32 %4, %3
  br i1 %5, label %6, label %45

6:                                                ; preds = %1
  %7 = and i32 %4, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %6
  %10 = add nsw i32 %3, 2
  %11 = mul nsw i32 %2, 3
  br label %15

12:                                               ; preds = %6
  %13 = add nsw i32 %3, -1
  %14 = sdiv i32 %2, 5
  br label %15

15:                                               ; preds = %12, %9
  %16 = phi i32 [ %14, %12 ], [ %11, %9 ]
  %17 = phi i32 [ %13, %12 ], [ %10, %9 ]
  br label %18

18:                                               ; preds = %32, %15
  %19 = phi i32 [ %33, %32 ], [ %16, %15 ]
  %20 = phi i32 [ %42, %32 ], [ 0, %15 ]
  %21 = phi i32 [ %34, %32 ], [ %17, %15 ]
  %22 = icmp slt i32 %20, %19
  br i1 %22, label %23, label %43

23:                                               ; preds = %18
  %24 = and i32 %20, 1
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %29

26:                                               ; preds = %23
  %27 = add nsw i32 %21, 2
  %28 = mul nsw i32 %19, 3
  br label %32

29:                                               ; preds = %23
  %30 = add nsw i32 %21, -1
  %31 = sdiv i32 %19, 5
  br label %32

32:                                               ; preds = %29, %26
  %33 = phi i32 [ %31, %29 ], [ %28, %26 ]
  %34 = phi i32 [ %30, %29 ], [ %27, %26 ]
  %35 = sitofp i32 %20 to double
  %36 = sitofp i32 %34 to double
  %37 = sitofp i32 %33 to double
  %38 = call double @find_max(double noundef %35, double noundef %36, double noundef %37)
  %39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %38) #4
  %40 = call double @find_min(double noundef %35, double noundef %36, double noundef %37)
  %41 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %40) #4
  %42 = add nuw nsw i32 %20, 1
  br label %18, !llvm.loop !9

43:                                               ; preds = %18
  %44 = add nuw nsw i32 %4, 1
  br label %1, !llvm.loop !10

45:                                               ; preds = %1
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
