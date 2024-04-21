; ModuleID = 'custom2.c'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: minsize nofree nosync nounwind optsize memory(none) uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %9, %3
  %5 = phi i32 [ -10, %3 ], [ %17, %9 ]
  %6 = phi double [ -1.000000e+09, %3 ], [ %16, %9 ]
  %7 = icmp eq i32 %5, 11
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  ret double %6

9:                                                ; preds = %4
  %10 = sitofp i32 %5 to double
  %11 = fmul double %10, %0
  %12 = fmul double %10, %1
  %13 = tail call double @llvm.fmuladd.f64(double %11, double %10, double %12)
  %14 = fadd double %13, %2
  %15 = fcmp ogt double %14, %6
  %16 = select i1 %15, double %14, double %6
  %17 = add nsw i32 %5, 1
  br label %4, !llvm.loop !5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: minsize nofree nosync nounwind optsize memory(none) uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %9, %3
  %5 = phi i32 [ -10, %3 ], [ %17, %9 ]
  %6 = phi double [ 1.000000e+09, %3 ], [ %16, %9 ]
  %7 = icmp eq i32 %5, 11
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  ret double %6

9:                                                ; preds = %4
  %10 = sitofp i32 %5 to double
  %11 = fmul double %10, %0
  %12 = fmul double %10, %1
  %13 = tail call double @llvm.fmuladd.f64(double %11, double %10, double %12)
  %14 = fadd double %13, %2
  %15 = fcmp olt double %14, %6
  %16 = select i1 %15, double %14, double %6
  %17 = add nsw i32 %5, 1
  br label %4, !llvm.loop !7
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %24, %0
  %2 = phi i32 [ 15, %0 ], [ %20, %24 ]
  %3 = phi i32 [ 10, %0 ], [ %21, %24 ]
  %4 = phi i32 [ 0, %0 ], [ %25, %24 ]
  %5 = icmp slt i32 %4, %2
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  ret i32 0

7:                                                ; preds = %1
  %8 = and i32 %4, 1
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = add nsw i32 %2, 2
  %12 = mul nsw i32 %3, 3
  br label %16

13:                                               ; preds = %7
  %14 = add nsw i32 %2, -1
  %15 = sdiv i32 %3, 5
  br label %16

16:                                               ; preds = %13, %10
  %17 = phi i32 [ %14, %13 ], [ %11, %10 ]
  %18 = phi i32 [ %15, %13 ], [ %12, %10 ]
  br label %19

19:                                               ; preds = %16, %35
  %20 = phi i32 [ %36, %35 ], [ %17, %16 ]
  %21 = phi i32 [ %37, %35 ], [ %18, %16 ]
  %22 = phi i32 [ %45, %35 ], [ 0, %16 ]
  %23 = icmp slt i32 %22, %21
  br i1 %23, label %26, label %24

24:                                               ; preds = %19
  %25 = add nuw nsw i32 %4, 1
  br label %1, !llvm.loop !8

26:                                               ; preds = %19
  %27 = and i32 %22, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %26
  %30 = add nsw i32 %20, 2
  %31 = mul nsw i32 %21, 3
  br label %35

32:                                               ; preds = %26
  %33 = add nsw i32 %20, -1
  %34 = sdiv i32 %21, 5
  br label %35

35:                                               ; preds = %32, %29
  %36 = phi i32 [ %30, %29 ], [ %33, %32 ]
  %37 = phi i32 [ %31, %29 ], [ %34, %32 ]
  %38 = sitofp i32 %22 to double
  %39 = sitofp i32 %36 to double
  %40 = sitofp i32 %37 to double
  %41 = tail call double @find_max(double noundef %38, double noundef %39, double noundef %40) #4
  %42 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %41) #4
  %43 = tail call double @find_min(double noundef %38, double noundef %39, double noundef %40) #4
  %44 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %43) #4
  %45 = add nuw nsw i32 %22, 1
  br label %19, !llvm.loop !9
}

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

attributes #0 = { minsize nofree nosync nounwind optsize memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { minsize nofree nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { minsize optsize }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 17.0.6"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
