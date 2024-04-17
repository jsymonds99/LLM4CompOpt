; ModuleID = 'custom2_unoptimized.ll'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  store double %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  store double -1.000000e+09, ptr %7, align 8
  br label %10

10:                                               ; preds = %22, %3
  %11 = phi double [ -1.000000e+09, %3 ], [ %23, %22 ]
  %12 = phi i32 [ -10, %3 ], [ %24, %22 ]
  store i32 %12, ptr %8, align 4
  %13 = icmp slt i32 %12, 11
  br i1 %13, label %14, label %25

14:                                               ; preds = %10
  %15 = sitofp i32 %12 to double
  %16 = fmul double %0, %15
  %17 = fmul double %1, %15
  %18 = call double @llvm.fmuladd.f64(double %16, double %15, double %17)
  %19 = fadd double %18, %2
  store double %19, ptr %9, align 8
  %20 = fcmp ogt double %19, %11
  br i1 %20, label %21, label %22

21:                                               ; preds = %14
  store double %19, ptr %7, align 8
  br label %22

22:                                               ; preds = %21, %14
  %23 = phi double [ %19, %21 ], [ %11, %14 ]
  %24 = add nsw i32 %12, 1
  br label %10, !llvm.loop !6

25:                                               ; preds = %10
  ret double %11
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  store double %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  store double 1.000000e+09, ptr %7, align 8
  br label %10

10:                                               ; preds = %22, %3
  %11 = phi double [ 1.000000e+09, %3 ], [ %23, %22 ]
  %12 = phi i32 [ -10, %3 ], [ %24, %22 ]
  store i32 %12, ptr %8, align 4
  %13 = icmp slt i32 %12, 11
  br i1 %13, label %14, label %25

14:                                               ; preds = %10
  %15 = sitofp i32 %12 to double
  %16 = fmul double %0, %15
  %17 = fmul double %1, %15
  %18 = call double @llvm.fmuladd.f64(double %16, double %15, double %17)
  %19 = fadd double %18, %2
  store double %19, ptr %9, align 8
  %20 = fcmp olt double %19, %11
  br i1 %20, label %21, label %22

21:                                               ; preds = %14
  store double %19, ptr %7, align 8
  br label %22

22:                                               ; preds = %21, %14
  %23 = phi double [ %19, %21 ], [ %11, %14 ]
  %24 = add nsw i32 %12, 1
  br label %10, !llvm.loop !8

25:                                               ; preds = %10
  ret double %11
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 15, ptr %1, align 4
  store i32 10, ptr %2, align 4
  br label %5

5:                                                ; preds = %45, %0
  %6 = phi i32 [ 10, %0 ], [ %22, %45 ]
  %7 = phi i32 [ 15, %0 ], [ %23, %45 ]
  %8 = phi i32 [ 0, %0 ], [ %46, %45 ]
  store i32 %8, ptr %3, align 4
  %9 = icmp slt i32 %8, %7
  br i1 %9, label %10, label %47

10:                                               ; preds = %5
  %11 = and i32 %8, 1
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = add nsw i32 %7, 2
  store i32 %14, ptr %1, align 4
  %15 = mul nsw i32 %6, 3
  br label %19

16:                                               ; preds = %10
  %17 = add nsw i32 %7, -1
  store i32 %17, ptr %1, align 4
  %18 = sdiv i32 %6, 5
  br label %19

19:                                               ; preds = %16, %13
  %20 = phi i32 [ %17, %16 ], [ %14, %13 ]
  %storemerge1 = phi i32 [ %18, %16 ], [ %15, %13 ]
  store i32 %storemerge1, ptr %2, align 4
  br label %21

21:                                               ; preds = %35, %19
  %22 = phi i32 [ %storemerge1, %19 ], [ %storemerge3, %35 ]
  %23 = phi i32 [ %20, %19 ], [ %36, %35 ]
  %24 = phi i32 [ 0, %19 ], [ %44, %35 ]
  store i32 %24, ptr %4, align 4
  %25 = icmp slt i32 %24, %22
  br i1 %25, label %26, label %45

26:                                               ; preds = %21
  %27 = and i32 %24, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %26
  %30 = add nsw i32 %23, 2
  store i32 %30, ptr %1, align 4
  %31 = mul nsw i32 %22, 3
  br label %35

32:                                               ; preds = %26
  %33 = add nsw i32 %23, -1
  store i32 %33, ptr %1, align 4
  %34 = sdiv i32 %22, 5
  br label %35

35:                                               ; preds = %32, %29
  %36 = phi i32 [ %33, %32 ], [ %30, %29 ]
  %storemerge3 = phi i32 [ %34, %32 ], [ %31, %29 ]
  store i32 %storemerge3, ptr %2, align 4
  %37 = sitofp i32 %24 to double
  %38 = sitofp i32 %36 to double
  %39 = sitofp i32 %storemerge3 to double
  %40 = call double @find_max(double noundef %37, double noundef %38, double noundef %39)
  %41 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %40) #4
  %42 = call double @find_min(double noundef %37, double noundef %38, double noundef %39)
  %43 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %42) #4
  %44 = add nsw i32 %24, 1
  br label %21, !llvm.loop !9

45:                                               ; preds = %21
  %46 = add nsw i32 %8, 1
  br label %5, !llvm.loop !10

47:                                               ; preds = %5
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
